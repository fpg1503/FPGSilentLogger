//
//  FPGViewController.m
//  FPGSilentLogger
//
//  Created by Francesco Perrotti-Garcia on 10/23/2015.
//  Copyright (c) 2015 Francesco Perrotti-Garcia. All rights reserved.
//

#import "FPGViewController.h"
#import <FPGSilentLogger/FPGLogger.h>
#import <HealthKit/HealthKit.h>

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
    
    NSError *error = nil;
    
    //WRONG!
    NSLog(@"NSData with contents of URL, no error"); //Will not log an error
    NSData *dataFromURL = [NSData dataWithContentsOfURL:URL];
    
    //WRONG!
    NSLog(@"NSData with contents of URL, error = nil"); //Will not log an error
    NSData *dataFromURL2 = [NSData dataWithContentsOfURL:URL options:0 error:nil];
    
    //RIGHT!
    NSLog(@"NSData with contents of URL, error = &error"); //Will log an error
    NSData *dataFromURL3 = [NSData dataWithContentsOfURL:URL options:0 error:&error];
    
    //RIGHT! (it's ok to ignore an error inside a block
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    //ignoring NSError, oh noes
                }] resume];
    
    NSLog(@"Blood type with reused error");
    HKHealthStore *healthStore = [[HKHealthStore alloc] init];
    HKBloodTypeObject *bloodType = [healthStore bloodTypeWithError:&error];
    //Does not work - TODO: figure out how this error is created!
    
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    
    NSLog(@"Contents of directory with reused error");
    [defaultManager contentsOfDirectoryAtPath:nil error:&error];
    
}

#pragma mark - FPGLoggerDelegate
- (void)logString:(nonnull NSString *)string {
    NSLog(@"%@", string);
}

- (nullable NSString *)logPrefix {
    return @"[FPG] ";
}

@end
