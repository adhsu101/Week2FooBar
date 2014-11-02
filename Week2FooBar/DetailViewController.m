//
//  DetailViewController.m
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import "DetailViewController.h"
#import "City.h"
#import "WebViewController.h"
#import "URLStringViewController.h"


@interface DetailViewController () <UITextFieldDelegate, CityDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property NSString *urlString;
@property (strong, nonatomic) IBOutlet UITextField *editNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *editStateTextField;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.city.name;
    self.stateLabel.text = self.city.state;
    self.imageView.image = self.city.image;
    self.city.delegate = self;
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)button
{
    if ([button.title isEqualToString:@"Edit"])
    {
        button.style = UIBarButtonItemStyleDone;
        button.title = @"Done";
        self.editNameTextField.hidden = NO;
        self.editNameTextField.placeholder = self.city.name;
        self.editStateTextField.hidden = NO;
        self.editStateTextField.placeholder = self.city.state;
    }
    else
    {
        button.style = UIBarButtonItemStylePlain;
        button.title = @"Edit";
        self.editStateTextField.hidden = YES;
        self.editNameTextField.hidden = YES;
        if (![self.editNameTextField.text isEqualToString:@""])
        {
            self.city.name = self.editNameTextField.text;
            self.nameLabel.text = self.city.name;
        }
        if (![self.editStateTextField.text isEqualToString:@""])
        {
            self.city.state = self.editStateTextField.text;
            self.stateLabel.text = self.city.state;
        }
        [self.editNameTextField resignFirstResponder];
        [self.editStateTextField resignFirstResponder];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)onLearnMoreButtonPressed:(UIButton *)button
{
    [self.city giveURL];
}

# pragma mark - City Delegates

- (void)wikiPageRequested:(NSString *)urlString
{
    self.urlString = urlString;
    [self performSegueWithIdentifier:@"learnMoreSegue" sender:self];
}

# pragma mark - segue life cycle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"learnMoreSegue"])
    {
        URLStringViewController *vc = segue.destinationViewController;
        vc.urlString = self.urlString;
    }
    else
    {
        WebViewController *vc = segue.destinationViewController;
        vc.city = self.city;
    }
}

@end
