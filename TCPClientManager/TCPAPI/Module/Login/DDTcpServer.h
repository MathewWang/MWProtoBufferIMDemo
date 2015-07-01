//
//  DDTcpServer.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ClientSuccess)();
@interface DDTcpServer : NSObject
{
    
}
- (void)loginTcpServerIP:(NSString*)ip port:(NSInteger)point Success:(void(^)())success failure:(void(^)())failure;
@end
