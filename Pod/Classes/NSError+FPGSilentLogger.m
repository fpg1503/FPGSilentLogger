//
//  NSError+FPGSilentLogger.m
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/23/15.
//
//

#import "FPGLogger.h"
#import "FPGSwizzleHelper.h"

@implementation NSError (FPGSilentLogger)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [FPGSwizzleHelper fpg_swizzleMethod:@selector(initWithDomain:code:userInfo:) withMethod:@selector(fpg_initWithDomain:code:userInfo:) ofClass:[self class]];
    });
}

- (instancetype)fpg_initWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(nullable NSDictionary *)dict {
    
    FPGLog(@"Error created. Domain: %@, Code: %ld, UserInfo: %@", domain, (long)code, dict);
    
    return [self fpg_initWithDomain:domain code:code userInfo:dict];
}

@end
