//
//  UILabel+CJWLabel.m
//  CJWUtils
//
//  Created by cen on 14/11/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "UILabel+CJWLabel.h"

@implementation UILabel (CJWLabel)


-(void)alignTop {
    CGSize fontSize =[self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height *self.numberOfLines;
    double finalWidth =self.frame.size.width;//expected width of label
    CGSize theStringSize =[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad =(finalHeight - theStringSize.height)/ fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text =[self.text stringByAppendingString:@"\n "];
}
@end
