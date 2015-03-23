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


-(void)scrollToTop:(BOOL)animate{
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:animate];
}


/*
 private func createLabel(txt:String) -> UILabel{
 var label = UILabel(frame: CGRectMake(0, 0, self.frame.width, 44))
 label.text = txt
 label.textAlignment = NSTextAlignment.Center
 label.textColor = UIColor.lightGrayColor()
 return label
 }
 
 func showHeaderTxt(txt:NSString){
 self.tableHeaderView = createLabel(txt)
 }
 
 func showFooterTxt(txt:NSString){
 self.tableFooterView = createLabel(txt)
 }
 
 func hideHeaderTxt(){
 self.tableHeaderView = UIView(frame: CGRectZero)
 }
 
 func hideFooterTxt(){
 self.tableFooterView = UIView(frame: CGRectZero)
 }
 */

-(void)hideFooterTxt{
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

@end
