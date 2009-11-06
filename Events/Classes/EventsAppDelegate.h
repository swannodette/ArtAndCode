//
//  EventsAppDelegate.h
//  Events
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventsViewController;

@interface EventsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EventsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EventsViewController *viewController;

@end

