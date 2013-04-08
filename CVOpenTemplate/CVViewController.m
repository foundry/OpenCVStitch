//
//  CVViewController.m
//  CVOpenTemplate
//
//  Created by Washe on 02/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#import "CVViewController.h"
#import "CVWrapper.h"

@interface CVViewController ()

@end

@implementation CVViewController

- (void)viewDidAppear:(BOOL)animated    
{
    [super viewDidAppear:animated];
    [self stitch];
   

}

- (void) stitch
{
    [self.spinner startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        NSArray* imageArray = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"pano_19_16_mid.jpg"]
                               ,[UIImage imageNamed:@"pano_19_20_mid.jpg"]
                               ,[UIImage imageNamed:@"pano_19_22_mid.jpg"]
                               ,[UIImage imageNamed:@"pano_19_25_mid.jpg"]
                               , nil];
        UIImage* stitchedImage = [CVWrapper processWithArray:imageArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog (@"stitchedImage %@",stitchedImage);
            UIImageView* imageView = [[UIImageView alloc] initWithImage:stitchedImage];
            self.imageView = imageView;
            [self.scrollView addSubview:imageView];
            self.scrollView.backgroundColor = [UIColor blackColor];
            self.scrollView.contentSize = self.imageView.bounds.size;
            self.scrollView.maximumZoomScale = 4.0;
            self.scrollView.minimumZoomScale = 0.5;
            self.scrollView.contentOffset = CGPointMake(-(self.scrollView.bounds.size.width-self.imageView.bounds.size.width)/2, -(self.scrollView.bounds.size.height-self.imageView.bounds.size.height)/2);
            NSLog (@"scrollview contentSize %@",NSStringFromCGSize(self.scrollView.contentSize));
            [self.spinner stopAnimating];
            
        });
    });
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scroll view delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


@end
