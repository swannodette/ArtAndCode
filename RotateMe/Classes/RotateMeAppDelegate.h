//
//  RotateMeAppDelegate.h
//  RotateMe
//
//  Created by David Nolen on 2/16/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RotateMeViewController;

@interface RotateMeAppDelegate : NSObject <UIApplicationDelegate> 
{
  UIWindow *window;
  RotateMeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RotateMeViewController *viewController;

@end

