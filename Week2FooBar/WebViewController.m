//
//  WebViewController.m
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.city.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)onCloseButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
