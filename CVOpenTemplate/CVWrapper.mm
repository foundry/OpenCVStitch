//
//  CVWrapper.m
//  CVOpenTemplate
//
//  Created by jonathan on 02/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#import "CVWrapper.h"
#import "CVProcessImage.h"
#import "UIImage+OpenCV.h"


@implementation CVWrapper

+ (UIImage*) processImageWithOpenCV: (UIImage*) inputImage
{
    UIImage* result = nil;
    cv::Mat inputMatImage = [inputImage CVMat];
    cv::Mat outputMatImage = CVProcessImage::processImage(inputMatImage);
    result = [UIImage imageWithCVMat:outputMatImage];
    return result;
}

+ (UIImage*) processWithOpenCVImage1:(UIImage*)inputImage1 image2:(UIImage*)inputImage2;
{
    UIImage* result = nil;
    cv::Mat inputMatImage1 = [inputImage1 CVMat];
    cv::Mat inputMatImage2 = [inputImage2 CVMat];

    cv::Mat outputMatImage = CVProcessImage::processImagePair(inputMatImage1,inputMatImage2);
    result = [UIImage imageWithCVMat:outputMatImage];
    return result;
}


@end
