//
//  FPGSwizzleHelper.m
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#import "FPGLogger.h"
#import "FPGSwizzleHelper.h"
#import <JRSwizzle/JRSwizzle.h>

@implementation FPGSwizzleHelper

+ (void)fpg_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ ofClass:(Class)class {
    NSError *error;
    BOOL result = [class jr_swizzleMethod:origSel_ withMethod:altSel_ error:&error];
    if (!result || error) {
        #ifdef FPG_LOG_SWIZZLE_ERRORS
                FPGLog(@"Could not swizzle method %@ with %@ of class %@", NSStringFromSelector(origSel_), NSStringFromSelector(altSel_), NSStringFromClass(class));
        #endif
    }
}

+ (void)fpg_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ ofClass:(Class)class {
    NSError *error;
    BOOL result = [class jr_swizzleClassMethod:origSel_ withClassMethod:altSel_ error:&error];
    if (!result || error) {
        NSError *error;
        BOOL result = [class jr_swizzleMethod:origSel_ withMethod:altSel_ error:&error];
        if (!result || error) {
            #ifdef FPG_LOG_SWIZZLE_ERRORS
                FPGLog(@"Could not swizzle class method %@ with %@ of class %@", NSStringFromSelector(origSel_), NSStringFromSelector(altSel_), NSStringFromClass(class));
            #endif
        }
    }
}

@end
