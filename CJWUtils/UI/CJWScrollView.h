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

-(void)addRefreshHeader:(id)target refreshingAction:(SEL)action NS_DEPRECATED_IOS(3_0,6_0);

-(void)addRefreshFooter:(id)target refreshingAction:(SEL)action NS_DEPRECATED_IOS(3_0,6_0);

@end