//
//  ResourceFunViewController.h
//  ResourceFun
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResourceFunViewController : UIViewController 
{
  CGRect      originalFrame;
  BOOL        toggle;
  UIImageView *imageView;
}

- (IBAction)animate:(id)sender;

@end

