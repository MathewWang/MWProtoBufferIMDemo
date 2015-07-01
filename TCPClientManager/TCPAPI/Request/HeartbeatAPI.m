//
//  DDHeartbeatAPI.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "HeartbeatAPI.h"
#import "Request.pb.h"
@implementation HeartbeatAPI
/**
 *  请求超时时间
 *
 *  @return 超时时间
 */
- (int)requestTimeOutTimeInterval
{
    return 0;
}

/**
 *  请求的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)requestServiceID
{
    //return DDHEARTBEAT_SID;
    return HEARTBEAT_SERVICE_ID;
}

/**
 *  请求返回的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)responseServiceID
{
    //return DDHEARTBEAT_SID;
    return HEARTBEAT_SERVICE_ID;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    //return REQ_CID;
    return HEARTBEAT_CMD_ID;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    //return RES_CID;
    return HEARTBEAT_CMD_ID;
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
    Package package = (id)^(id object,UInt32 seqNo)
    {
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        
        RequestHeader_Builder* requestHeader = [RequestHeader builder];
        [requestHeader setSid:HEARTBEAT_SERVICE_ID];
        [requestHeader setCid:HEARTBEAT_CMD_ID];
        [requestHeader setSeqNo:seqNo];

        RequestMsg_Builder* requestMsg = [RequestMsg builder];
        [requestMsg setHeaderBuilder:requestHeader];
        [requestMsg setBody:nil];
        
        NSData* pbData = [requestMsg build].data;
        [dataout writeInt:(int32_t)pbData.length];
        [dataout directWriteBytes:pbData];
        
        return [dataout toByteArray];
    };
    return package;
}
@end
