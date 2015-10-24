//
//  FPGLogger.h
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#define FPGLog(...) [FPGLogger logString:[NSString stringWithFormat:__VA_ARGS__]]
#import "FPGLoggerDelegate.h"

NSString * _Nonnull NSStrigFromBool(BOOL boolean);

static _Nullable id<FPGLoggerDelegate> delegate;

@interface FPGLogger : NSObject

+ (void)setDelegate:(nullable id<FPGLoggerDelegate>)delegate;
+ (void)logString:(nonnull NSString *)string;

@end
