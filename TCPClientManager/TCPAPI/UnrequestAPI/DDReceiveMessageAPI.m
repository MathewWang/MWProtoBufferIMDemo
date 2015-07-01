//
//  DDReceiveMessageAPI.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDReceiveMessageAPI.h"
#import "Send.pb.h"
@implementation DDReceiveMessageAPI
- (int)responseServiceID
{
    //return DDSERVICE_MESSAGE;
    return RECEMSG_SERVICE_ID;
}

- (int)responseCommandID
{
    //return DDCMD_MSG_DATA;
    return RECEMSG_RES_CMD_ID;
}

- (UnrequestAPIAnalysis)unrequestAnalysis
{
    UnrequestAPIAnalysis analysis = (id)^(NSData *data)
    {
        SendRes* msgData = [SendRes parseFromData:data];
        return msgData.content;
    };
    return analysis;
}
@end
