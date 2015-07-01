//
//  DataOutputStream+Addition.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDDataOutputStream.h"

@interface DDDataOutputStream (Addition)
-(void)writeTcpProtocolHeader:(int16_t)sId cId:(int16_t)cId seqNo:(uint16_t)seqNo;
@end
