//
//  CVProcessImage.h
//  CVOpenTemplate
//
//  Created by jonathan on 03/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#ifndef __CVOpenTemplate__CVProcessImage__
#define __CVOpenTemplate__CVProcessImage__

#include <iostream>

    //class definition
    //in this example we do not need a class
    //as we have no instance variables and just one static function.
    //We could instead just declare the function but this form seems clearer


class CVProcessImage
{
public:
    static cv::Mat processImage     (cv::Mat image);
    static cv::Mat processImagePair (cv::Mat image1,cv::Mat image2);

        //static void    processImage (cv::Mat& image);
};



#endif /* defined(__CVOpenTemplate__CVProcessImage__) */

