//
//  MessageEntity.h
//  TCPClientManager
//
//  Created by liangjianfeng on 15/6/23.
//  Copyright (c) 2015年 MathewWang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MsgTypeMsgTypeSingleText = 1,
    MsgTypeMsgTypeSingleAudio = 2,
    MsgTypeMsgTypeGroupText = 17,
    MsgTypeMsgTypeGroupAudio = 18,
} MsgType;

@interface MessageEntity : NSObject

@property(nonatomic, assign) MsgType MsgType;
@property(nonatomic, assign)NSUInteger seqNo;
@property(nonatomic, strong)NSArray* msgContent;

@end
