//
//  TabBarAppDelegate.h
//  TabBar
//
//  Created by David Nolen on 3/10/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarAppDelegate : NSObject <UIApplicationDelegate> {
  IBOutlet UITabBarController *tabBarController;
  UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

