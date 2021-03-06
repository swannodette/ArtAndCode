//
//  CocoaAppDelegate.h
//  Cocoa
//
//  Created by David Nolen on 11/2/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CocoaAppDelegate : NSObject <NSApplicationDelegate> 
{
  NSWindow *window;
  IBOutlet NSButton *createLotsButon;
  IBOutlet NSButton *createLotsBetterButton;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction) createLotsOfObjects:(id)sender;
- (IBAction) createLotsOfObjectsBetter:(id)sender;

@end
