//
//  City.h
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property NSString *name;
@property NSString *state;
@property UIImage *image;
@property NSString *urlString;

- (instancetype)initWithName:(NSString *)name
                    andState:(NSString *)state
                    andImage:(UIImage *)image
                andURLString:(NSString *)urlString;

@end
