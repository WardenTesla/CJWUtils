//
//  UIImageView+CJWImage.h
//  CJWUtils
//
//  Created by cen on 9/10/14.
//  Copyright (c) 2014 cen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CJWImage)


@end

@interface UIImage (CJWImage)

-(UIImage *)compress;

+(UIImage*)compressImageDownToPhoneScreenSize:(UIImage*)theImage;

@end


@interface UIImageView (CJWCircleImageView)

//-(UIImage *)compress;

//+(UIImage*)compressImageDownToPhoneScreenSize:(UIImage*)theImage;

+(UIImageView*)imageToCircle:(UIImageView*)imageView;


@end