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
        Swizzle(initWithDomain:code:userInfo:)
    });
}

- (instancetype)fpg_initWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(nullable NSDictionary *)dict {
    
    [self fpg_initWithDomain:domain code:code userInfo:dict];
    
    FPGLog(@"Error created. Domain: %@, Code: %ld, UserInfo: %@, Localized description: %@", domain, (long)code, dict, self.localizedDescription);
    
    return self;
}

@end
