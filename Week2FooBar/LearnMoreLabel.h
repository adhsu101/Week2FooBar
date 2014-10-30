//
//  LearnMoreLabel.h
//  Week2FooBar
//
//  Created by Mobile Making on 10/30/14.
//  Copyright (c) 2014 Alex Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LearnMoreLabelDelegate <NSObject>

- (void)learnMoreTapped;

@end

@interface LearnMoreLabel : UILabel

@property id <LearnMoreLabelDelegate> delegate;


@end
