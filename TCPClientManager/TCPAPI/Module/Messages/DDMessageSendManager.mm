
//
//  DDMessageSendManager.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDMessageSendManager.h"
#import "DDTcpClientManager.h"
#import "SendMessageAPI.h"
#import "UnAckMessageManager.h"
#import "DDClientState.h"
#import "security.h"
#import "MessageEntity.h"
static uint32_t seqNo = 0;

@interface DDMessageSendManager(PrivateAPI)

- (NSString* )toSendmessageContentFromContent:(NSString*)content;

@end

@implementation DDMessageSendManager
{
    NSUInteger _uploadImageCount;
}
+ (instancetype)instance
{
    static DDMessageSendManager* g_messageSendManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_messageSendManager = [[DDMessageSendManager alloc] init];
    });
    return g_messageSendManager;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _uploadImageCount = 0;
        _waitToSendMessage = [[NSMutableArray alloc] init];
        _sendMessageSendQueue = dispatch_queue_create("com.mogujie.Duoduo.sendMessageSend", NULL);
        
    }
    return self;
}

- (void)sendMessage:(MessageEntity *)message completion:(SendMessageCompletion)completion Error:(void (^)(NSError *))block
{

    dispatch_async(self.sendMessageSendQueue, ^{
        SendMessageAPI* sendMessageAPI = [[SendMessageAPI alloc] init];
        uint32_t nowSeqNo = ++seqNo;
        message.seqNo=nowSeqNo;
   
        NSArray* newContent = message.msgContent;

        /*char* pOut;
        uint32_t nOutLen;
        const char *test =[newContent cStringUsingEncoding:NSUTF8StringEncoding];
        uint32_t nInLen  = strlen(test);
        EncryptMsg(test, nInLen, &pOut, nOutLen);
        NSData *data = [[NSString stringWithCString:pOut encoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding];
        Free(pOut);*/

        //[[UnAckMessageManager instance] addMessageToUnAckQueue:message];
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"SentMessageSuccessfull" object:session];
        [sendMessageAPI requestWithObject:newContent Completion:^(id response, NSError *error) {
            if (!error)
            {
                    NSLog(@"发送消息成功");
                
                    //[[UnAckMessageManager instance] removeMessageFromUnAckQueue:message];

                    //[[NSNotificationCenter defaultCenter] postNotificationName:@"SentMessageSuccessfull" object:session];
                    completion(message,nil);
           
                
            }
            else
            {
                //message.state=DDMessageSendFailure;
                NSError* error = [NSError errorWithDomain:@"发送消息失败" code:0 userInfo:nil];
                block(error);
            }
        }];
        
    });
}

/*- (void)sendVoiceMessage:(NSData*)voice filePath:(NSString*)filePath forSessionID:(NSString*)sessionID isGroup:(BOOL)isGroup Message:(DDMessageEntity *)msg Session:(SessionEntity*)session completion:(DDSendMessageCompletion)completion
{
    dispatch_async(self.sendMessageSendQueue, ^{
        SendMessageAPI* sendVoiceMessageAPI = [[SendMessageAPI alloc] init];

        NSString* myUserID = [RuntimeStatus instance].user.objID;
        NSArray* object = @[myUserID,sessionID,voice,@(msg.msgType),@(0)];
        [sendVoiceMessageAPI requestWithObject:object Completion:^(id response, NSError *error) {
            if (!error)
            {
              
                
                NSLog(@"发送消息成功");
                
              
                NSUInteger messageTime = [[NSDate date] timeIntervalSince1970];
                msg.msgTime=messageTime;
                msg.msgID=[response[0] integerValue];
                msg.state=DDmessageSendSuccess;
                session.lastMsg=@"[语音]";
                session.lastMsgID=msg.msgID;
                session.timeInterval=msg.msgTime;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"SentMessageSuccessfull" object:session];

                    completion(msg,nil);
                
            }
            else
            {
                NSError* error = [NSError errorWithDomain:@"发送消息失败" code:0 userInfo:nil];
                completion(nil,error);
            }
        }];

    });
}*/

#pragma mark Private API

- (NSString* )toSendmessageContentFromContent:(NSString*)content
{
    /*EmotionsModule* emotionModule = [EmotionsModule shareInstance];
    NSDictionary* unicodeDic = emotionModule.unicodeEmotionDic;
    NSArray* allEmotions = emotionModule.emotions;
    NSMutableString* newContent = [NSMutableString stringWithString:content];
    [allEmotions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* emotion = (NSString*)obj;
        if ([newContent rangeOfString:emotion].length > 0)
        {
            NSString* placeholder = unicodeDic[emotion];
            NSRange range = NSMakeRange(0, newContent.length);
            [newContent replaceOccurrencesOfString:emotion withString:placeholder options:0 range:range];
        }
    }];
    return newContent;*/
    return @"";
}


@end
