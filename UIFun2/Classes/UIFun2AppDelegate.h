//
//  UIFun2AppDelegate.h
//  UIFun2
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIFun2ViewController;

@interface UIFun2AppDelegate : NSObject <UIApplicationDelegate> 
{
  UIWindow *window;
  UIFun2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIFun2ViewController *viewController;

@end

