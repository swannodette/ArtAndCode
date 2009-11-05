//
//  FirstAppDelegate.h
//  First
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;

@interface FirstAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow             *window;
  FirstViewController  *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FirstViewController *viewController;

@end

