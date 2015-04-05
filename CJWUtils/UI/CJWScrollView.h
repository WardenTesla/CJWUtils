//
//  CJWScrollView.h
//  CJWUtils
//
//  Created by cen on 5/4/15.
//  Copyright (c) 2015 cen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJWScrollView : UIScrollView

@end


@interface UIScrollView (CJWRefreshableScrollView)

-(void)addRefreshHeader:(id)target refreshingAction:(SEL)action;

-(void)addRefreshFooter:(id)target refreshingAction:(SEL)action;

@end