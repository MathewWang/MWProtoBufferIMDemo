//
//  DDSundriesCenter.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Task)();

@interface DDSundriesCenter : NSObject

@property (nonatomic,readonly)dispatch_queue_t serialQueue;
@property (nonatomic,readonly)dispatch_queue_t parallelQueue;

+ (instancetype)instance;
- (void)pushTaskToSerialQueue:(Task)task;
- (void)pushTaskToParallelQueue:(Task)task;
- (void)pushTaskToSynchronizationSerialQUeue:(Task)task;
@end
