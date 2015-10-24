//
//  FPGLogger.h
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#define FPGLog(...) [FPGLogger logString:[NSString stringWithFormat:__VA_ARGS__]]
#import <Foundation/Foundation.h>

@protocol FPGLoggerDelegate;

NSString * _Nonnull NSStrigFromBool(BOOL boolean);

static _Nullable id<FPGLoggerDelegate> delegate;

@interface FPGLogger : NSObject

+ (void)logString:(nonnull NSString *)string;

@end
