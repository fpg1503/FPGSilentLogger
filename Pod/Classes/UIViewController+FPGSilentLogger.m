//
//  UIViewController+FPGSilentLogger.m
//  Pods
//
//  Created by Francesco Perrotti-Garcia on 10/24/15.
//
//

#import "FPGLogger.h"
#import "FPGSwizzleHelper.h"

@implementation UIViewController (FPGSilentLogger)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Swizzle(viewDidLoad);
        Swizzle(viewWillAppear:);
        Swizzle(viewDidAppear:);
        Swizzle(viewWillDisappear:);
        Swizzle(viewDidDisappear:);
    });
}

- (void)fpg_viewDidLoad {
    [self fpg_viewDidLoad];
    FPGLog(@"View did load: %@", NSStringFromClass(self.class));
}

- (void)fpg_viewWillAppear:(BOOL)animated {
    [self fpg_viewWillAppear:animated];
    FPGLog(@"View will appear: %@ - Animated = %@", NSStringFromClass(self.class), NSStrigFromBool(animated));
}

- (void)fpg_viewDidAppear:(BOOL)animated {
    [self fpg_viewDidAppear:animated];
    FPGLog(@"View did appear: %@ - Animated = %@", NSStringFromClass(self.class), NSStrigFromBool(animated));
}

- (void)fpg_viewWillDisappear:(BOOL)animated {
    [self fpg_viewWillDisappear:animated];
    FPGLog(@"View will disappear: %@ - Animated = %@", NSStringFromClass(self.class), NSStrigFromBool(animated));
}

- (void)fpg_viewDidDisappear:(BOOL)animated {
    [self fpg_viewDidDisappear:animated];
    FPGLog(@"View did disappear: %@ - Animated = %@", NSStringFromClass(self.class), NSStrigFromBool(animated));
}

@end
