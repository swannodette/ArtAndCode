//
//  UIFun3AppDelegate.h
//  UIFun3
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIFun3ViewController;

@interface UIFun3AppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

