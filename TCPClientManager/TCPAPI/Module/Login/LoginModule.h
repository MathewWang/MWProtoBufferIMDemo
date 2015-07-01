//
//  DDLoginManager.h
//  Duoduo
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DDMsgServer,DDTcpServer;
@interface LoginModule : NSObject
{
    DDMsgServer* _msgServer;
    DDTcpServer* _tcpServer;
}

@property (nonatomic,readonly)NSString* token;
@property (nonatomic,strong)NSString * priorIP;

+ (instancetype)instance;

/**
 *  登录接口，整个登录流程
 *
 *  @param name     用户名
 *  @param password 密码
 */
- (void)loginWithUsername:(NSString*)name password:(NSString*)password success:(void(^)(id user))success failure:(void(^)(NSString* error))failure;
/**
 *  离线
 */
- (void)offlineCompletion:(void(^)())completion;
- (void)reloginSuccess:(void(^)())success failure:(void(^)(NSString* error))failure;
@end
