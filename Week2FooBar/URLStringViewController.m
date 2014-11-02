//
//  URLStringViewController.m
//  Week2FooBar
//
//  Created by Mobile Making on 11/1/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import "URLStringViewController.h"

@interface URLStringViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation URLStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];}

- (IBAction)onCloseButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
