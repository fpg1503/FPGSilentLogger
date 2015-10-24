//
//  FPGLoggerDelegate.h
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#import <Foundation/Foundation.h>

@protocol FPGLoggerDelegate <NSObject>

- (void)logString:(nonnull NSString *)string;

@optional
- (nullable NSString *)logPrefix;

@end
