//
//  NSString+Additions.h
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (mogujieString)

+(NSString *)documentPath;
+(NSString *)cachePath;
+(NSString *)formatCurDate;
+(NSString *)formatCurDay;
+(NSString *)getAppVer;
- (NSString*)removeAllSpace;
+(NSString *)formatCurDayForVersion;
- (NSURL *) toURL;
- (BOOL) isEmail;
- (BOOL) isEmpty;
- (NSString *) MD5;
-(NSString *)trim;

-(BOOL) isOlderVersionThan:(NSString*)otherVersion;
-(BOOL) isNewerVersionThan:(NSString*)otherVersion;
@end
