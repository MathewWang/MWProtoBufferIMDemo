//
//  DDLoginAPI.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "LoginAPI.h"
#import "NSString+Additions.h"
#import "security.h"
#import "Login.pb.h"
#import "Request.pb.h"
#import "Respone.pb.h"


@implementation LoginAPI
/**
 *  请求超时时间
 *
 *  @return 超时时间
 */
- (int)requestTimeOutTimeInterval
{
    return 15;
}

/**
 *  请求的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)requestServiceID
{
    //return DDSERVICE_LOGIN;
    return LOGIN_SERVICE_ID;
}

/**
 *  请求返回的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)responseServiceID
{
    //return DDSERVICE_LOGIN;
    return LOGIN_SERVICE_ID;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    //return DDCMD_LOGIN_REQ_USERLOGIN;
    return LOGIN_CMD_ID;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    //return DDCMD_LOGIN_RES_USERLOGIN;
    return LOGIN_CMD_ID;
}

/**
 *  解析数据的block
 *
 *  @return 解析数据的block
 */
- (Analysis)analysisReturnData
{
    Analysis analysis = (id)^(NSData* data)
    {
        LoginRes* loginRes = [LoginRes parseFromData:data];
        NSLog(@"返回结果是：%d", [loginRes resCode]);
        NSDictionary* result = nil;
        if ([loginRes resCode] >= 0) {
            result = @{@"result":[NSString stringWithFormat:@"%d",[loginRes resCode]],
                       @"user":@"Mathew",
                       };
            return result;
        }
        return result;
    };
    return analysis;
}

/**
 *  打包数据的block
 *
 *  @return 打包数据的block
 */
- (Package)packageRequestObject
{
    Package package = (id)^(id object,uint32_t seqNo)
    {

        NSString * name = object[0];
        NSString * pwd = object[1];
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        
        RequestHeader_Builder* requestHeader = [RequestHeader builder];
        [requestHeader setSid:LOGIN_SERVICE_ID];
        [requestHeader setCid:LOGIN_CMD_ID];
        [requestHeader setSeqNo:seqNo];
        
        LoginReq_Builder* login = [LoginReq builder];
        [login setUserName:name];
        [login setPassword:[pwd intValue]];
        
        
        RequestMsg_Builder* requestMsg = [RequestMsg builder];
        [requestMsg setHeaderBuilder:requestHeader];
        [requestMsg setBody:[login build].data];
        
        NSData* pbData = [requestMsg build].data;
        [dataout writeInt:(int32_t)pbData.length];
        [dataout directWriteBytes:pbData];

        return [dataout toByteArray];
    };
    return package;
}
@end
