//
//  UITableView+CJWTabelView.m
//  CJWUtils
//
//  Created by cen on 10/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "UITableView+CJWTabelView.h"

@implementation UITableView (CJWTabelView)

-(void)clearExtraLines{
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

@end
