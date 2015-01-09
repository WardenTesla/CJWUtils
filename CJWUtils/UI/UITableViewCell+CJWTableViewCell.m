//
//  UITableViewCell+CJWTableViewCell.m
//  CJWUtils
//
//  Created by cen on 9/1/15.
//  Copyright (c) 2015 cen. All rights reserved.
//

#import "UITableViewCell+CJWTableViewCell.h"

@implementation UITableViewCell (CJWTableViewCell)

-(void)clearSeparatorInset{
    self.separatorInset = UIEdgeInsetsZero;
    self.layoutMargins = UIEdgeInsetsZero;
    self.preservesSuperviewLayoutMargins = false;
}
@end
