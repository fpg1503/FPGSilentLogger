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

NSString * _Nonnull NSStrigFromBool(BOOL boolean) {
    return boolean ? @"YES" : @"NO";
}

@implementation FPGLogger

+ (void)setDelegate:(nullable id<FPGLoggerDelegate>)delegate_ {
    delegate = delegate_;
}

+ (void)logString:(nonnull NSString *)string {
    //avoid locking caller if delegate logger is too slow
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
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
    });
}

@end
