//
//  DetailViewController.m
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import "DetailViewController.h"
#import "LearnMoreLabel.h"

@interface DetailViewController () <UITextViewDelegate, LearnMoreLabelDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet LearnMoreLabel *learnMoreLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.city.name;
    self.stateLabel.text = self.city.state;
    self.imageView.image = self.city.image;
    self.learnMoreLabel.delegate = self;
    
}

- (void)learnMoreTapped
{
//    [self performSegueWithIdentifier:@"learnMoreSegue" sender:<#(id)#>];
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender
{
    
}
@end
