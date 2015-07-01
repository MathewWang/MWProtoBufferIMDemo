//
//  DDMsgServer.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDMsgServer.h"
#import "DDTcpClientManager.h"
#import "LoginAPI.h"
#import "DDNotificationHelp.h"
#import "DDCONSTANT.h"
static int const timeOutTimeInterval = 10;

typedef void(^CheckSuccess)(id object);

@interface DDMsgServer(PrivateAPI)

- (void)n_receiveLoginMsgServerNotification:(NSNotification*)notification;
- (void)n_receiveLoginLoginServerNotification:(NSNotification*)notification;

@end

@implementation DDMsgServer
{
    CheckSuccess _success;
    Failure _failure;
    
    BOOL _connecting;
    NSUInteger _connectTimes;
}
- (id)init
{
    self = [super init];
    if (self)
    {
        _connecting = NO;
        _connectTimes = 0;
    }
    return self;
}

-(void)checkUserID:(NSString*)userID Pwd:(NSString *)password token:(NSString*)token success:(void(^)(id object))success failure:(void(^)(id object))failure
{
    
    if (!_connecting)
    {
        
        NSArray* parameter = @[userID,password];
        
        LoginAPI* api = [[LoginAPI alloc] init];
        [api requestWithObject:parameter Completion:^(id response, NSError *error) {
            if (!error)
            {
                if (response)
                {
                    NSString *resultString =response[@"resultString"];
                    if (resultString == nil) {
                         success(response);
                    }
                }else{
                    failure(error);
                }
                
            }
            else
            {
                DDLog(@"error:%@",[error domain]);
                failure(error);
            }
        }];
    }
}

@end
