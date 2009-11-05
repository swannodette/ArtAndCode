//
//  FirstViewController.m
//  First
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

- (void)viewDidLoad 
{
  [super viewDidLoad];
}

- (IBAction)sayHello:(id)sender
{
  if(nil == name)
  {
    label.text = @"Hello world!";    
  }
  else 
  {
    label.text = [NSString stringWithFormat:@"Hello %@!", name];
  }
}

- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
}

// let see what kind of messages we get!
- (BOOL) respondsToSelector:(SEL)aSelector
{
  NSLog(@"FirstViewController respondsToSelector: %@", NSStringFromSelector(aSelector));
  return [super respondsToSelector:aSelector];
}

- (BOOL)textFieldShouldReturn:(UITextField *)aInput 
{
  if (aInput == input) 
  {
    if(name) [name release];
    name = [input.text copy];
    [input resignFirstResponder];
  }
  return YES;
}

- (void)dealloc 
{
  if(name)
  {
    [name release];
    name = nil;
  }
  [super dealloc];
}

@end
