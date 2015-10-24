//
//  FPGLogger.m
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#import "FPGLogger.h"
#import "FPGLoggerDelegate.h"

#define fpg_logString @"%@%@", prefix, string

@implementation FPGLogger

+ (void)logString:(nonnull NSString *)string {
    NSString *prefix = [delegate respondsToSelector:@selector(logPrefix)] ? [delegate logPrefix] : @"";
        
    if ([delegate conformsToProtocol:@protocol(FPGLoggerDelegate) ]) {
        [delegate logString:[NSString stringWithFormat:fpg_logString]];
    } else {
        #ifdef CLS_LOG
            CLS_LOG(fpg_logString);
        #else
            NSLog(fpg_logString);
        #endif

    }
}

@end
