//
//  DDMsgServer.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DDMsgServer : NSObject
/**
 *  连接消息服务器
 *
 *  @param userID  用户ID
 *  @param token   token
 *  @param success 连接成功执行的block
 *  @param failure 连接失败执行的block
 */
-(void)checkUserID:(NSString*)userID Pwd:(NSString *)password token:(NSString*)token success:(void(^)(id object))success failure:(void(^)(id object))failure;
@end
