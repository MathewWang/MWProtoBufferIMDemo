//
//  NSStream+NSStreamAddition.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CFNetwork/CFNetwork.h>

@interface NSStream (NSStreamAddition)
+ (void)getStreamsToHostNamed:(NSString *)hostName port:(NSInteger)port inputStream:(NSInputStream **)inputStream outputStream:(NSOutputStream **)outputStream;
@end

@interface NSMutableData (NSMutableDataExtension)

-(void)writeBool:(BOOL)value;
-(void)writeByte:(uint8_t)value;
-(void)writeShort:(short)value;
-(void)writeInt:(int)value;
-(void)writeLong:(long long)value;
-(void)writeFloat:(float)value;
-(void)writeDouble:(double)value;
-(void)writeUTF:(NSString *)value;

@end
