//
//  Array_Speed_TestAppDelegate.h
//  Array Speed Test
//
//  Created by Mehmet Akten on 05/02/2009.
//  Copyright MSA Visuals Ltd. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Array_Speed_TestViewController;

@interface Array_Speed_TestAppDelegate : NSObject <UIApplicationDelegate> 
{
	UIWindow *window;
	Array_Speed_TestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Array_Speed_TestViewController *viewController;

@end

