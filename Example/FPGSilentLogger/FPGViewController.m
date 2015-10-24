//
//  FPGViewController.m
//  FPGSilentLogger
//
//  Created by Francesco Perrotti-Garcia on 10/23/2015.
//  Copyright (c) 2015 Francesco Perrotti-Garcia. All rights reserved.
//

#import "FPGViewController.h"
#import <FPGSilentLogger/FPGLogger.h>

@interface FPGViewController () <FPGLoggerDelegate>

@end

@implementation FPGViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //Using custom logger
        //You probably want to do this in a better place!
        //View did load will be logged using the default logger
        [FPGLogger setDelegate:self];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *URL = [NSURL URLWithString:@"http://example.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    //ignoring NSError, oh noes
                }] resume];
}

#pragma mark - FPGLoggerDelegate
- (void)logString:(nonnull NSString *)string {
    NSLog(@"%@", string);
}

- (nullable NSString *)logPrefix {
    return @"[FPG] ";
}

@end
