//
//  UIFun3ViewController.m
//  UIFun3
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "UIFun3ViewController.h"

@implementation UIFun3ViewController


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
  {
  }
  return self;
}


- (id)initWithCoder:(NSCoder*)coder
{
  self = [super initWithCoder:coder];
  if(self != nil)
  {
    self.title = @"";
  }
  return self;
}


- (void)viewDidLoad 
{
  [super viewDidLoad];
  
  UINavigationBar *navigationBar = [self.navigationController navigationBar];
  UIImage *catImage = [UIImage imageNamed:@"cat.png"];
  UIImageView *catView = [[UIImageView alloc] initWithImage:catImage];
  
  // The nav bar expects a UINavigationItem (which must have certain properties)
  // but nothing stops us from modifying the navigationBar's view hierarchy directly,
  
  CGRect bounds = [catView bounds];
  
  catView.frame = CGRectMake((320/2)-(catImage.size.width/2), (44/2)-(catImage.size.height/2), bounds.size.width, bounds.size.height);
  [navigationBar addSubview:catView];
  
  // You could just as easily put your own UIButton there
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
