// Generated by the protocol buffer compiler.  DO NOT EDIT!
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.

#import "ProtocolBuffers.h"

@class LoginReq;
@class LoginReq_Builder;
@class LoginRes;
@class LoginRes_Builder;

@interface LoginRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface LoginReq : PBGeneratedMessage {
@private
  BOOL hasPassword_:1;
  BOOL hasUserName_:1;
  int32_t password;
  NSString* userName;
}
- (BOOL) hasUserName;
- (BOOL) hasPassword;
@property (readonly, retain) NSString* userName;
@property (readonly) int32_t password;

+ (LoginReq*) defaultInstance;
- (LoginReq*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (LoginReq_Builder*) builder;
+ (LoginReq_Builder*) builder;
+ (LoginReq_Builder*) builderWithPrototype:(LoginReq*) prototype;

+ (LoginReq*) parseFromData:(NSData*) data;
+ (LoginReq*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (LoginReq*) parseFromInputStream:(NSInputStream*) input;
+ (LoginReq*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (LoginReq*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (LoginReq*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface LoginReq_Builder : PBGeneratedMessageBuilder {
@private
  LoginReq* result;
}

- (LoginReq*) defaultInstance;

- (LoginReq_Builder*) clear;
- (LoginReq_Builder*) clone;

- (LoginReq*) build;
- (LoginReq*) buildPartial;

- (LoginReq_Builder*) mergeFrom:(LoginReq*) other;
- (LoginReq_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (LoginReq_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUserName;
- (NSString*) userName;
- (LoginReq_Builder*) setUserName:(NSString*) value;
- (LoginReq_Builder*) clearUserName;

- (BOOL) hasPassword;
- (int32_t) password;
- (LoginReq_Builder*) setPassword:(int32_t) value;
- (LoginReq_Builder*) clearPassword;
@end

@interface LoginRes : PBGeneratedMessage {
@private
  BOOL hasResCode_:1;
  int32_t resCode;
}
- (BOOL) hasResCode;
@property (readonly) int32_t resCode;

+ (LoginRes*) defaultInstance;
- (LoginRes*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (LoginRes_Builder*) builder;
+ (LoginRes_Builder*) builder;
+ (LoginRes_Builder*) builderWithPrototype:(LoginRes*) prototype;

+ (LoginRes*) parseFromData:(NSData*) data;
+ (LoginRes*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (LoginRes*) parseFromInputStream:(NSInputStream*) input;
+ (LoginRes*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (LoginRes*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (LoginRes*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface LoginRes_Builder : PBGeneratedMessageBuilder {
@private
  LoginRes* result;
}

- (LoginRes*) defaultInstance;

- (LoginRes_Builder*) clear;
- (LoginRes_Builder*) clone;

- (LoginRes*) build;
- (LoginRes*) buildPartial;

- (LoginRes_Builder*) mergeFrom:(LoginRes*) other;
- (LoginRes_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (LoginRes_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasResCode;
- (int32_t) resCode;
- (LoginRes_Builder*) setResCode:(int32_t) value;
- (LoginRes_Builder*) clearResCode;
@end

