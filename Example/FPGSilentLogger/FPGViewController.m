//
//  FPGViewController.m
//  FPGSilentLogger
//
//  Created by Francesco Perrotti-Garcia on 10/23/2015.
//  Copyright (c) 2015 Francesco Perrotti-Garcia. All rights reserved.
//

#import "FPGViewController.h"

@interface FPGViewController ()

@end

@implementation FPGViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
