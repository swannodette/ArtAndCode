//
//  ResourceFunAppDelegate.h
//  ResourceFun
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ResourceFunViewController;

@interface ResourceFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ResourceFunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ResourceFunViewController *viewController;

@end

