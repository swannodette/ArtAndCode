//
//  FirstViewController.h
//  First
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>
{
  IBOutlet UIButton    *button;
  IBOutlet UILabel     *label;
  IBOutlet UITextField *input;
}

- (IBAction)sayHello:(id)sender;

@end

