//
//  ViewController.m
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import "RootViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *citiesArray;
@property City *city;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    
    City *sanFran = [[City alloc] initWithName:@"San Francisco" andState:@"California" andImage:[UIImage imageNamed:@"sanfran"] andURLString:@"http://en.wikipedia.org/wiki/San_Francisco"];
    City *newyork = [[City alloc] initWithName:@"New York" andState:@"New York" andImage:[UIImage imageNamed:@"newyork"] andURLString:@"http://en.wikipedia.org/wiki/New_York_City"];
    City *albuq = [[City alloc] initWithName:@"Albuquerque" andState:@"New Mexico" andImage:[UIImage imageNamed:@"albuq"] andURLString:@"http://en.wikipedia.org/wiki/Albuquerque,_New_Mexico"];
    City *orlando = [[City alloc] initWithName:@"Orlando" andState:@"Florida" andImage:[UIImage imageNamed:@"orlando"] andURLString:@"http://en.wikipedia.org/wiki/Orlando,_Florida"];
    self.citiesArray = [@[sanFran, newyork, albuq, orlando] mutableCopy];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

# pragma mark - Table View Delegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    City *city = self.citiesArray[indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = city.image;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.citiesArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.citiesArray removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}


# pragma mark - Segue Life Cycle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *vc = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    City *city = [self.citiesArray objectAtIndex:rowNumber];
    vc.city = city;
}


@end
