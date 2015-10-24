//
//  FPGSwizzleHelper.h
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#import <Foundation/Foundation.h>

#define FPG_LOG_SWIZZLE_ERRORS
//Swizzling NSError's designated initializer may fail. We want to track swizzling error manually.

@interface FPGSwizzleHelper : NSObject

+ (void)fpg_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ ofClass:(Class)class;
+ (void)fpg_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ ofClass:(Class)class;


@end
