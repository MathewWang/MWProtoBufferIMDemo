//
//  DDUnrequestSuperAPI.m
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDUnrequestSuperAPI.h"
#import "DDAPISchedule.h"
@implementation DDUnrequestSuperAPI
- (BOOL)registerAPIInAPIScheduleReceiveData:(ReceiveData)received
{
    BOOL registerSuccess = [[DDAPISchedule instance] registerUnrequestAPI:(id<DDAPIUnrequestScheduleProtocol>)self];
    if (registerSuccess)
    {
        self.receivedData = received;
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
