//
//  DDUnrequestSuperAPI.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDDataInputStream.h"
#import "DDAPIUnrequestScheduleProtocol.h"
#import "DDTcpClientManager.h"
#import "DDDataOutputStream.h"
#import "DataOutputStream+Addition.h"
#import "DDTcpProtocolHeader.h"
typedef void(^ReceiveData)(id object,NSError* error);

@interface DDUnrequestSuperAPI : NSObject
@property (nonatomic,copy)ReceiveData receivedData;
- (BOOL)registerAPIInAPIScheduleReceiveData:(ReceiveData)received;
@end
