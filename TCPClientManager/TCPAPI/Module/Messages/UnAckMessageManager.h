//
//  UnAckMessageManage.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UnAckMessageManager : NSObject
+ (instancetype)instance;
//-(void)removeMessageFromUnAckQueue:(DDMessageEntity *)message;
//-(void)addMessageToUnAckQueue:(DDMessageEntity *)message;
//-(BOOL)isInUnAckQueue:(DDMessageEntity *)message;
@end


@interface MessageAndTime : NSObject
//@property(strong)DDMessageEntity *msg;
@property(assign)NSUInteger nowDate;
@end
