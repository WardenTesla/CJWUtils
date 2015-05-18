//
//  CJWViewController.h
//  CJWUtils
//
//  Created by cen on 18/5/15.
//  Copyright (c) 2015 cen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJWViewController : UIViewController

@end


@interface UIViewController (CJWViewController)
+(UIViewController *)getCurrentRootViewController;

@end