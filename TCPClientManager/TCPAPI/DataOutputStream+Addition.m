//
//  DataOutputStream+Addition.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DataOutputStream+Addition.h"
#import "NSStream+NSStreamAddition.h"
#import "DDCONSTANT.h"

@implementation DDDataOutputStream (Addition)
-(void)writeTcpProtocolHeader:(int16_t)sId cId:(int16_t)cId seqNo:(uint16_t)seqNo
{
    [self writeShort:IM_PDU_VERSION];
    [self writeShort:0]; //默认值
    [self writeShort:sId];
    [self writeShort:cId];
    //[self writeShort:0]; //默认值
    [self writeShort:seqNo]; //默认值
    [self writeShort:1];
}
@end
