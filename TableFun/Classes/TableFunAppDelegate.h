//
//  TableFunAppDelegate.h
//  TableFun
//
//  Created by David Nolen on 3/11/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableFunAppDelegate : NSObject <UIApplicationDelegate> 
{
  IBOutlet UITableViewController *tableViewController;
  UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

