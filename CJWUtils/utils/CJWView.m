//
//  CJWView.m
//  CJWUtils
//
//  Created by cen on 23/3/15.
//  Copyright (c) 2015 cen. All rights reserved.
//

#import "CJWView.h"

@implementation CJWView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)blur{
    [self blur:UIBlurEffectStyleDark];
}

-(void)blur:(UIBlurEffectStyle)style{
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = self.bounds;
    [self addSubview:visualEffectView];
}

@end
