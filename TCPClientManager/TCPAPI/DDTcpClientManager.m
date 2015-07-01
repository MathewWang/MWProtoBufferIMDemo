//
//  DDTcpClientManager.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDTcpClientManager.h"
#import "NSStream+NSStreamAddition.h"
#import "DDSendBuffer.h"
#import "DDTcpProtocolHeader.h"
#import "DDDataInputStream.h"
#import "DDDataOutputStream.h"
#import "DDAPISchedule.h"
#import "DDClientState.h"
#import "DDNotificationHelp.h"
#import "DDCONSTANT.h"
#import "Respone.pb.h"

@interface DDTcpClientManager(PrivateAPI)

- (void)p_handleConntectOpenCompletedStream:(NSStream *)aStream;
- (void)p_handleEventErrorOccurredStream:(NSStream *)aStream;
- (void)p_handleEventEndEncounteredStream:(NSStream *)aStream;
- (void)p_handleEventHasBytesAvailableStream:(NSStream *)aStream;
- (void)p_handleEventHasSpaceAvailableStream:(NSStream *)aStream;
@end

@implementation DDTcpClientManager
+ (instancetype)instance
{
    static DDTcpClientManager* g_tcpClientManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_tcpClientManager = [[DDTcpClientManager alloc] init];
    });
    return g_tcpClientManager;
}

#pragma mark - PublicAPI
-(void)connect:(NSString *)ipAdr port:(NSInteger)port status:(NSInteger)status
{
    DDLog(@"mogujie mtalk client :connect ipAdr:%@ port:%ld",ipAdr,(long)port);
    cDataLen = 0;
    
    _receiveBuffer = [NSMutableData data];
    _sendBuffers = [NSMutableArray array];
    _noDataSent = NO;
    
    _receiveLock = [[NSLock alloc] init];
    _sendLock = [[NSLock alloc] init];
    
    NSInputStream  *tempInput  = nil;
    NSOutputStream *tempOutput = nil;
    
    [NSStream getStreamsToHostNamed:ipAdr port:port inputStream:&tempInput outputStream:&tempOutput];
    _inStream  = tempInput;
    _outStream = tempOutput;
    
    [_inStream setDelegate:self];
    [_outStream setDelegate:self];
    
    [_inStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_outStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [_inStream open];
    [_outStream open];
}

-(void)disconnect
{
    DDLog(@"MTalk Client:disconnect");
    
    cDataLen = 0;
    
	_receiveLock = nil;
	_sendLock = nil;
    if(_inStream)
    {
        [_inStream close];
        [_inStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
	_inStream = nil;
    
    if (_outStream) {
        [_outStream close];
        [_outStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
	
	_outStream = nil;
    
	_receiveBuffer = nil;
	_sendBuffers = nil;
	_lastSendBuffer = nil;
    
    [DDNotificationHelp postNotification:DDNotificationTcpLinkDisconnect userInfo:nil object:nil];


}

-(void)writeToSocket:(NSMutableData *)data{
    [_sendLock lock];
    
    @try {
        if (_noDataSent ==YES) {
            
            NSInteger len;
            len = [_outStream write:(const uint8_t *)[data mutableBytes] maxLength:[data length]];
            _noDataSent = NO;
            DDLog(@"WRITE - Written directly to outStream len:%li", (long)len);
            if (len < [data length]) {
                DDLog(@"WRITE - Creating a new buffer for remaining data len:%ld", [data length] - len);
                _lastSendBuffer = [DDSendBuffer dataWithNSData:[data subdataWithRange:NSMakeRange([data length]-len, [data length])]];
                [_sendBuffers addObject:_lastSendBuffer];
                
            }
            return;
        }
        
        if (_lastSendBuffer) {
            NSInteger lastSendBufferLength;
            NSInteger newDataLength;
            lastSendBufferLength = [_lastSendBuffer length];
            newDataLength = [data length];
            if (lastSendBufferLength<1024) {
                DDLog(@"WRITE - Have a buffer with enough space, appending data to it");
                [_lastSendBuffer appendData:data];
                return;
            }
        }
        DDLog(@"WRITE - Creating a new buffer");
        _lastSendBuffer = [DDSendBuffer dataWithNSData:data];
        [_sendBuffers addObject:_lastSendBuffer];
        
    }
    @catch (NSException *exception) {
        DDLog(@" ***** NSException:%@ in writeToSocket of MGJMTalkClient *****",exception);
    }
    @finally {
        [_sendLock unlock];
    }
}

#pragma mark - NSStream Delegate
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    switch(eventCode) {
        case NSStreamEventNone:
			DDLog(@"Event type: EventNone");
			break;
        case NSStreamEventOpenCompleted:
			[self p_handleConntectOpenCompletedStream:aStream];
			break;
		case NSStreamEventHasSpaceAvailable:          //发送数据
            [self p_handleEventHasSpaceAvailableStream:aStream];
            break;
		case NSStreamEventErrorOccurred:
			[self p_handleEventErrorOccurredStream:aStream];
			break;
		case NSStreamEventEndEncountered:
			[self p_handleEventEndEncounteredStream:aStream];
			break;
        case NSStreamEventHasBytesAvailable:
            [self p_handleEventHasBytesAvailableStream:aStream];
            break;
    }
}

#pragma mark - PrivateAPI
- (void)p_handleConntectOpenCompletedStream:(NSStream *)aStream
{
    DDLog(@"handleConntectOpenCompleted");
    if (aStream == _outStream) {
        [DDNotificationHelp postNotification:DDNotificationTcpLinkConnectComplete userInfo:nil object:nil];
    }
}

- (void)p_handleEventHasSpaceAvailableStream:(NSStream *)aStream
{
    [_sendLock lock];
    
    @try {
        
        if (![_sendBuffers count]) {
            DDLog(@"WRITE - No data to send");
            _noDataSent = YES;
            
            return;
        }
        
        DDSendBuffer *sendBuffer = [_sendBuffers objectAtIndex:0];
        
        NSInteger sendBufferLength = [sendBuffer length];
        
        if (!sendBufferLength) {
            if (sendBuffer == _lastSendBuffer) {
                _lastSendBuffer = nil;
            }
            
            [_sendBuffers removeObjectAtIndex:0];
            
            DDLog(@"WRITE - No data to send");
            
            _noDataSent = YES;
            
            return;
        }
        
        NSInteger len = ((sendBufferLength - [sendBuffer sendPos] >= 1024) ? 1024 : (sendBufferLength - [sendBuffer sendPos]));
        if (!len) {
            if (sendBuffer == _lastSendBuffer) {
                _lastSendBuffer = nil;
            }
            
            [_sendBuffers removeObjectAtIndex:0];
            
            DDLog(@"WRITE - No data to send");
            
            _noDataSent = YES;
            
            return;
        }
        
        DDLog(@"write %ld bytes", (int)len);
        len = [_outStream write:((const uint8_t *)[sendBuffer mutableBytes] + [sendBuffer sendPos]) maxLength:len];
        DDLog(@"WRITE - Written directly to outStream len:%lid", (long)len);
        [sendBuffer consumeData:len];
        
        if (![sendBuffer length]) {
            if (sendBuffer == _lastSendBuffer) {
                _lastSendBuffer = nil;
            }
            
            [_sendBuffers removeObjectAtIndex:0];
        }
        
        _noDataSent = NO;
        
        
        return;
    }
    @catch (NSException *exception) {
        DDLog(@" ***** NSException in MGJMTalkCleint :%@  ******* ",exception);
    }
    @finally {
        [_sendLock unlock];
    }
}

- (void)p_handleEventErrorOccurredStream:(NSStream *)aStream
{
    DDLog(@"handle eventErrorOccurred");
    [self disconnect];
    [DDClientState shareInstance].userState = DDUserOffLine;
}

- (void)p_handleEventEndEncounteredStream:(NSStream *)aStream
{
    DDLog(@"handle eventEndEncountered");
    
    cDataLen = 0;

}

- (void)p_handleEventHasBytesAvailableStream:(NSStream *)aStream
{
    DDLog(@"handle eventHasBytesAvailable");
    if (aStream) {
        uint8_t buf[1024];
        NSInteger len = 0;
        len = [(NSInputStream *)aStream read:buf maxLength:1024];
        
        if (len > 0) {
            
            
            [_receiveLock lock];
            [_receiveBuffer appendBytes:(const void *)buf length:len];
            
            //解析netty的固定header，目前服务端默认是4个字节
            while ([_receiveBuffer length] >= 4) {
                NSRange range = NSMakeRange(0, 4);
                
                NSData *headerData = [_receiveBuffer subdataWithRange:range];
                
                DDDataInputStream *inputData = [DDDataInputStream dataInputStreamWithData:headerData];
                
                uint32_t pduLen = [inputData readInt];
                if (pduLen > (uint32_t)[_receiveBuffer length]) {
                    DDLog(@"not enough data received");
                    break;
                }
                
                range = NSMakeRange(4, pduLen);
                NSData *payloadData = [_receiveBuffer subdataWithRange:range];
                ResponeMsg* response = [ResponeMsg parseFromData:payloadData];
                
                uint32_t remainLen = (int)[_receiveBuffer length] - 4 - pduLen;
                range = NSMakeRange(pduLen, remainLen);
                NSData *remainData = [_receiveBuffer subdataWithRange:range];
                [_receiveBuffer setData:remainData];
                ServerDataType dataType = DDMakeServerDataType(response.header.sid, response.header.cid, response.header.seqNo, response.header.code);
                
                if (response.body.length >0) {
                    [[DDAPISchedule instance] receiveServerData:response.body forDataType:dataType];
                }
                [DDNotificationHelp postNotification:DDNotificationServerHeartBeat userInfo:nil object:nil];
                
            }
            
            [_receiveLock unlock];
        }
        else {
            DDLog(@"No buffer!");
        }

    }
   
}

@end
