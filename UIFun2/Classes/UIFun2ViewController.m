//
//  UIFun2ViewController.m
//  UIFun2
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "UIFun2ViewController.h"

@implementation UIFun2ViewController

- (IBAction)select:(UIButton*)sender
{
  sender.selected = !sender.selected;
  [sender setNeedsDisplay];
}


- (void)viewDidLoad 
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.gif"]];
}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


- (void)viewDidUnload 
{
}


- (void)dealloc 
{
  [super dealloc];
}

@end
