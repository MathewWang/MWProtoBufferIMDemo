//
//  ReceiveServerHeartBeatAPI.m
//  TCPClientManager
//
//  Created by liangjianfeng on 15/6/24.
//  Copyright (c) 2015年 MathewWang. All rights reserved.
//

#import "ReceiveServerHeartBeatAPI.h"
#import "HeartbeatAPI.h"

@implementation ReceiveServerHeartBeatAPI

- (int)responseServiceID
{
    //return DDSERVICE_MESSAGE;
    return HEARTBEAT_SERVICE_ID;
}

- (int)responseCommandID
{
    //return DDCMD_MSG_DATA;
    return HEARTBEAT_CMD_ID;
}

- (UnrequestAPIAnalysis)unrequestAnalysis
{
    UnrequestAPIAnalysis analysis = (id)^(NSData *data)
    {
        NSLog(@"收到服务端的心跳。。。。。。");
        /*HeartbeatAPI* heartBeatAPI = [[HeartbeatAPI alloc] init];
        [heartBeatAPI requestWithObject:nil Completion:nil];*/
    };
    return analysis;
}


@end
