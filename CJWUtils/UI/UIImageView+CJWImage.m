//
//  UIImageView+CJWImage.m
//  CJWUtils
//
//  Created by cen on 9/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import "UIImageView+CJWImage.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (CJWImage)

+(UIImage*)compressImageDownToPhoneScreenSize:(UIImage*)theImage{
    
    UIImage * bigImage = theImage;
    
    float actualHeight = bigImage.size.height;
    float actualWidth = bigImage.size.width;
    
    float imgRatio = actualWidth / actualHeight;
    float maxRatio = 480.0 / 640;
    
    if( imgRatio != maxRatio ){
        if(imgRatio < maxRatio){
            imgRatio = 480.0 / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = 480.0;
            
        } else {
            imgRatio = 320.0 / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = 320.0;
        }
        
    }
    
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [bigImage drawInRect:rect]; // scales image to rect
    theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //RETURN
    return theImage;
    
}
@end
