//
//  City.m
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName:(NSString *)name
                    andState:(NSString *)state
                    andImage:(UIImage *)image
                andURLString:(NSString *)urlString
{
    self = [super init];
    self.name = name;
    self.state = state;
    self.image = image;
    self.urlString = urlString;
    
    return self;
}

@end