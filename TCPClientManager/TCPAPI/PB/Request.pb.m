// Generated by the protocol buffer compiler.  DO NOT EDIT!
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.

#import "Request.pb.h"

@implementation RequestRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [RequestRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface RequestHeader ()
@property int32_t sid;
@property int32_t cid;
@property int32_t seqNo;
@end

@implementation RequestHeader

- (BOOL) hasSid {
  return !!hasSid_;
}
- (void) setHasSid:(BOOL) value {
  hasSid_ = !!value;
}
@synthesize sid;
- (BOOL) hasCid {
  return !!hasCid_;
}
- (void) setHasCid:(BOOL) value {
  hasCid_ = !!value;
}
@synthesize cid;
- (BOOL) hasSeqNo {
  return !!hasSeqNo_;
}
- (void) setHasSeqNo:(BOOL) value {
  hasSeqNo_ = !!value;
}
@synthesize seqNo;
- (void) dealloc {
  //[super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.sid = 0;
    self.cid = 0;
    self.seqNo = 0;
  }
  return self;
}
static RequestHeader* defaultRequestHeaderInstance = nil;
+ (void) initialize {
  if (self == [RequestHeader class]) {
    defaultRequestHeaderInstance = [[RequestHeader alloc] init];
  }
}
+ (RequestHeader*) defaultInstance {
  return defaultRequestHeaderInstance;
}
- (RequestHeader*) defaultInstance {
  return defaultRequestHeaderInstance;
}
- (BOOL) isInitialized {
  if (!self.hasSid) {
    return NO;
  }
  if (!self.hasCid) {
    return NO;
  }
  if (!self.hasSeqNo) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasSid) {
    [output writeInt32:1 value:self.sid];
  }
  if (self.hasCid) {
    [output writeInt32:2 value:self.cid];
  }
  if (self.hasSeqNo) {
    [output writeInt32:3 value:self.seqNo];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasSid) {
    size += computeInt32Size(1, self.sid);
  }
  if (self.hasCid) {
    size += computeInt32Size(2, self.cid);
  }
  if (self.hasSeqNo) {
    size += computeInt32Size(3, self.seqNo);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (RequestHeader*) parseFromData:(NSData*) data {
  return (RequestHeader*)[[[RequestHeader builder] mergeFromData:data] build];
}
+ (RequestHeader*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RequestHeader*)[[[RequestHeader builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (RequestHeader*) parseFromInputStream:(NSInputStream*) input {
  return (RequestHeader*)[[[RequestHeader builder] mergeFromInputStream:input] build];
}
+ (RequestHeader*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RequestHeader*)[[[RequestHeader builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (RequestHeader*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (RequestHeader*)[[[RequestHeader builder] mergeFromCodedInputStream:input] build];
}
+ (RequestHeader*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RequestHeader*)[[[RequestHeader builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (RequestHeader_Builder*) builder {
  return [[RequestHeader_Builder alloc] init];
}
+ (RequestHeader_Builder*) builderWithPrototype:(RequestHeader*) prototype {
  return [[RequestHeader builder] mergeFrom:prototype];
}
- (RequestHeader_Builder*) builder {
  return [RequestHeader builder];
}
@end

@interface RequestHeader_Builder()
@property (retain) RequestHeader* result;
@end

@implementation RequestHeader_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  //[super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[RequestHeader alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (RequestHeader_Builder*) clear {
  self.result = [[RequestHeader alloc] init];
  return self;
}
- (RequestHeader_Builder*) clone {
  return [RequestHeader builderWithPrototype:result];
}
- (RequestHeader*) defaultInstance {
  return [RequestHeader defaultInstance];
}
- (RequestHeader*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (RequestHeader*) buildPartial {
  RequestHeader* returnMe = result;
  self.result = nil;
  return returnMe;
}
- (RequestHeader_Builder*) mergeFrom:(RequestHeader*) other {
  if (other == [RequestHeader defaultInstance]) {
    return self;
  }
  if (other.hasSid) {
    [self setSid:other.sid];
  }
  if (other.hasCid) {
    [self setCid:other.cid];
  }
  if (other.hasSeqNo) {
    [self setSeqNo:other.seqNo];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (RequestHeader_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (RequestHeader_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setSid:[input readInt32]];
        break;
      }
      case 16: {
        [self setCid:[input readInt32]];
        break;
      }
      case 24: {
        [self setSeqNo:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasSid {
  return result.hasSid;
}
- (int32_t) sid {
  return result.sid;
}
- (RequestHeader_Builder*) setSid:(int32_t) value {
  result.hasSid = YES;
  result.sid = value;
  return self;
}
- (RequestHeader_Builder*) clearSid {
  result.hasSid = NO;
  result.sid = 0;
  return self;
}
- (BOOL) hasCid {
  return result.hasCid;
}
- (int32_t) cid {
  return result.cid;
}
- (RequestHeader_Builder*) setCid:(int32_t) value {
  result.hasCid = YES;
  result.cid = value;
  return self;
}
- (RequestHeader_Builder*) clearCid {
  result.hasCid = NO;
  result.cid = 0;
  return self;
}
- (BOOL) hasSeqNo {
  return result.hasSeqNo;
}
- (int32_t) seqNo {
  return result.seqNo;
}
- (RequestHeader_Builder*) setSeqNo:(int32_t) value {
  result.hasSeqNo = YES;
  result.seqNo = value;
  return self;
}
- (RequestHeader_Builder*) clearSeqNo {
  result.hasSeqNo = NO;
  result.seqNo = 0;
  return self;
}
@end

@interface RequestMsg ()
@property (retain) RequestHeader* header;
@property (retain) NSData* body;
@end

@implementation RequestMsg

- (BOOL) hasHeader {
  return !!hasHeader_;
}
- (void) setHasHeader:(BOOL) value {
  hasHeader_ = !!value;
}
@synthesize header;
- (BOOL) hasBody {
  return !!hasBody_;
}
- (void) setHasBody:(BOOL) value {
  hasBody_ = !!value;
}
@synthesize body;
- (void) dealloc {
  self.header = nil;
  self.body = nil;
  //[super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.header = [RequestHeader defaultInstance];
    self.body = [NSData data];
  }
  return self;
}
static RequestMsg* defaultRequestMsgInstance = nil;
+ (void) initialize {
  if (self == [RequestMsg class]) {
    defaultRequestMsgInstance = [[RequestMsg alloc] init];
  }
}
+ (RequestMsg*) defaultInstance {
  return defaultRequestMsgInstance;
}
- (RequestMsg*) defaultInstance {
  return defaultRequestMsgInstance;
}
- (BOOL) isInitialized {
  if (!self.hasHeader) {
    return NO;
  }
  if (!self.hasBody) {
    return NO;
  }
  if (!self.header.isInitialized) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasHeader) {
    [output writeMessage:1 value:self.header];
  }
  if (self.hasBody) {
    [output writeData:2 value:self.body];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasHeader) {
    size += computeMessageSize(1, self.header);
  }
  if (self.hasBody) {
    size += computeDataSize(2, self.body);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (RequestMsg*) parseFromData:(NSData*) data {
  return (RequestMsg*)[[[RequestMsg builder] mergeFromData:data] build];
}
+ (RequestMsg*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RequestMsg*)[[[RequestMsg builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (RequestMsg*) parseFromInputStream:(NSInputStream*) input {
  return (RequestMsg*)[[[RequestMsg builder] mergeFromInputStream:input] build];
}
+ (RequestMsg*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RequestMsg*)[[[RequestMsg builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (RequestMsg*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (RequestMsg*)[[[RequestMsg builder] mergeFromCodedInputStream:input] build];
}
+ (RequestMsg*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RequestMsg*)[[[RequestMsg builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (RequestMsg_Builder*) builder {
  return [[RequestMsg_Builder alloc] init];
}
+ (RequestMsg_Builder*) builderWithPrototype:(RequestMsg*) prototype {
  return [[RequestMsg builder] mergeFrom:prototype];
}
- (RequestMsg_Builder*) builder {
  return [RequestMsg builder];
}
@end

@interface RequestMsg_Builder()
@property (retain) RequestMsg* result;
@end

@implementation RequestMsg_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  //[super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[RequestMsg alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (RequestMsg_Builder*) clear {
  self.result = [[RequestMsg alloc] init];
  return self;
}
- (RequestMsg_Builder*) clone {
  return [RequestMsg builderWithPrototype:result];
}
- (RequestMsg*) defaultInstance {
  return [RequestMsg defaultInstance];
}
- (RequestMsg*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (RequestMsg*) buildPartial {
  RequestMsg* returnMe = result;
  self.result = nil;
  return returnMe;
}
- (RequestMsg_Builder*) mergeFrom:(RequestMsg*) other {
  if (other == [RequestMsg defaultInstance]) {
    return self;
  }
  if (other.hasHeader) {
    [self mergeHeader:other.header];
  }
  if (other.hasBody) {
    [self setBody:other.body];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (RequestMsg_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (RequestMsg_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        RequestHeader_Builder* subBuilder = [RequestHeader builder];
        if (self.hasHeader) {
          [subBuilder mergeFrom:self.header];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setHeader:[subBuilder buildPartial]];
        break;
      }
      case 18: {
        [self setBody:[input readData]];
        break;
      }
    }
  }
}
- (BOOL) hasHeader {
  return result.hasHeader;
}
- (RequestHeader*) header {
  return result.header;
}
- (RequestMsg_Builder*) setHeader:(RequestHeader*) value {
  result.hasHeader = YES;
  result.header = value;
  return self;
}
- (RequestMsg_Builder*) setHeaderBuilder:(RequestHeader_Builder*) builderForValue {
  return [self setHeader:[builderForValue build]];
}
- (RequestMsg_Builder*) mergeHeader:(RequestHeader*) value {
  if (result.hasHeader &&
      result.header != [RequestHeader defaultInstance]) {
    result.header =
      [[[RequestHeader builderWithPrototype:result.header] mergeFrom:value] buildPartial];
  } else {
    result.header = value;
  }
  result.hasHeader = YES;
  return self;
}
- (RequestMsg_Builder*) clearHeader {
  result.hasHeader = NO;
  result.header = [RequestHeader defaultInstance];
  return self;
}
- (BOOL) hasBody {
  return result.hasBody;
}
- (NSData*) body {
  return result.body;
}
- (RequestMsg_Builder*) setBody:(NSData*) value {
  result.hasBody = YES;
  result.body = value;
  return self;
}
- (RequestMsg_Builder*) clearBody {
  result.hasBody = NO;
  result.body = [NSData data];
  return self;
}
@end
