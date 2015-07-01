//
//  DDSendMessageAPI.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "SendMessageAPI.h"
#import "Send.pb.h"
#import "Request.pb.h"
@implementation SendMessageAPI
/**
 *  请求超时时间
 *
 *  @return 超时时间
 */
- (int)requestTimeOutTimeInterval
{
    return 10;
}

/**
 *  请求的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)requestServiceID
{
    //return DDSERVICE_MESSAGE;
    return SENDMSG_SERVICE_ID;
}

/**
 *  请求返回的serviceID
 *
 *  @return 对应的serviceID
 */
- (int)responseServiceID
{
    //return DDSERVICE_MESSAGE;
    return SENDMSG_SERVICE_ID;
}

/**
 *  请求的commendID
 *
 *  @return 对应的commendID
 */
- (int)requestCommendID
{
    //return DDCMD_MSG_DATA;
    return SENDMSG_CMD_ID;
}

/**
 *  请求返回的commendID
 *
 *  @return 对应的commendID
 */
- (int)responseCommendID
{
    //return DDCMD_MSG_RECEIVE_DATA_ACK;
    return SENDMSG_CMD_ID;
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
        return @[@"111",@"222"];
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
    Package package = (id)^(id object,uint16_t seqNo)
    {
        
        
        DDDataOutputStream *dataout = [[DDDataOutputStream alloc] init];
        RequestHeader_Builder* requestHeader = [RequestHeader builder];
        [requestHeader setSid:SENDMSG_SERVICE_ID];
        [requestHeader setCid:SENDMSG_CMD_ID];
        [requestHeader setSeqNo:seqNo];
        
        SendReq_Builder* sendMsg = [SendReq builder];
        [sendMsg setUserName:[object objectAtIndex:0]];
        [sendMsg setToUserName:[object objectAtIndex:1]];
        [sendMsg setContent:[object objectAtIndex:2]];
        
        
        RequestMsg_Builder* requestMsg = [RequestMsg builder];
        [requestMsg setHeaderBuilder:requestHeader];
        [requestMsg setBody:[sendMsg build].data];
        
        NSData* pbData = [requestMsg build].data;
        [dataout writeInt:(int32_t)pbData.length];
        [dataout directWriteBytes:pbData];
        
        return [dataout toByteArray];

    };
    return package;
}

@end
