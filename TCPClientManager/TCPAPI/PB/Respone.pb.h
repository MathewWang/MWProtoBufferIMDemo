// Generated by the protocol buffer compiler.  DO NOT EDIT!
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.

#import "ProtocolBuffers.h"

@class ResponeMsg;
@class ResponeMsg_Builder;
@class ResponseHeader;
@class ResponseHeader_Builder;

@interface ResponeRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface ResponseHeader : PBGeneratedMessage {
@private
  BOOL hasSid_:1;
  BOOL hasCid_:1;
  BOOL hasSeqNo_:1;
  BOOL hasCode_:1;
  int32_t sid;
  int32_t cid;
  int32_t seqNo;
  int32_t code;
}
- (BOOL) hasSid;
- (BOOL) hasCid;
- (BOOL) hasSeqNo;
- (BOOL) hasCode;
@property (readonly) int32_t sid;
@property (readonly) int32_t cid;
@property (readonly) int32_t seqNo;
@property (readonly) int32_t code;

+ (ResponseHeader*) defaultInstance;
- (ResponseHeader*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (ResponseHeader_Builder*) builder;
+ (ResponseHeader_Builder*) builder;
+ (ResponseHeader_Builder*) builderWithPrototype:(ResponseHeader*) prototype;

+ (ResponseHeader*) parseFromData:(NSData*) data;
+ (ResponseHeader*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (ResponseHeader*) parseFromInputStream:(NSInputStream*) input;
+ (ResponseHeader*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (ResponseHeader*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (ResponseHeader*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface ResponseHeader_Builder : PBGeneratedMessageBuilder {
@private
  ResponseHeader* result;
}

- (ResponseHeader*) defaultInstance;

- (ResponseHeader_Builder*) clear;
- (ResponseHeader_Builder*) clone;

- (ResponseHeader*) build;
- (ResponseHeader*) buildPartial;

- (ResponseHeader_Builder*) mergeFrom:(ResponseHeader*) other;
- (ResponseHeader_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (ResponseHeader_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasSid;
- (int32_t) sid;
- (ResponseHeader_Builder*) setSid:(int32_t) value;
- (ResponseHeader_Builder*) clearSid;

- (BOOL) hasCid;
- (int32_t) cid;
- (ResponseHeader_Builder*) setCid:(int32_t) value;
- (ResponseHeader_Builder*) clearCid;

- (BOOL) hasSeqNo;
- (int32_t) seqNo;
- (ResponseHeader_Builder*) setSeqNo:(int32_t) value;
- (ResponseHeader_Builder*) clearSeqNo;

- (BOOL) hasCode;
- (int32_t) code;
- (ResponseHeader_Builder*) setCode:(int32_t) value;
- (ResponseHeader_Builder*) clearCode;
@end

@interface ResponeMsg : PBGeneratedMessage {
@private
  BOOL hasHeader_:1;
  BOOL hasBody_:1;
  ResponseHeader* header;
  NSData* body;
}
- (BOOL) hasHeader;
- (BOOL) hasBody;
@property (readonly, retain) ResponseHeader* header;
@property (readonly, retain) NSData* body;

+ (ResponeMsg*) defaultInstance;
- (ResponeMsg*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (ResponeMsg_Builder*) builder;
+ (ResponeMsg_Builder*) builder;
+ (ResponeMsg_Builder*) builderWithPrototype:(ResponeMsg*) prototype;

+ (ResponeMsg*) parseFromData:(NSData*) data;
+ (ResponeMsg*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (ResponeMsg*) parseFromInputStream:(NSInputStream*) input;
+ (ResponeMsg*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (ResponeMsg*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (ResponeMsg*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface ResponeMsg_Builder : PBGeneratedMessageBuilder {
@private
  ResponeMsg* result;
}

- (ResponeMsg*) defaultInstance;

- (ResponeMsg_Builder*) clear;
- (ResponeMsg_Builder*) clone;

- (ResponeMsg*) build;
- (ResponeMsg*) buildPartial;

- (ResponeMsg_Builder*) mergeFrom:(ResponeMsg*) other;
- (ResponeMsg_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (ResponeMsg_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasHeader;
- (ResponseHeader*) header;
- (ResponeMsg_Builder*) setHeader:(ResponseHeader*) value;
- (ResponeMsg_Builder*) setHeaderBuilder:(ResponseHeader_Builder*) builderForValue;
- (ResponeMsg_Builder*) mergeHeader:(ResponseHeader*) value;
- (ResponeMsg_Builder*) clearHeader;

- (BOOL) hasBody;
- (NSData*) body;
- (ResponeMsg_Builder*) setBody:(NSData*) value;
- (ResponeMsg_Builder*) clearBody;
@end
