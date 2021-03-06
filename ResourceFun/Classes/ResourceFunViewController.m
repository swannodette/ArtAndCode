//
//  ResourceFunViewController.m
//  ResourceFun
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "ResourceFunViewController.h"

@implementation ResourceFunViewController


- (void)viewDidLoad
{
  toggle = NO;
  [super viewDidLoad];

  // load a image resource
  imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.jpg"]];
  originalFrame = imageView.frame;
  NSLog(@"originalFrame %@", NSStringFromCGRect(originalFrame));
  [self.view addSubview:imageView];
  // CHALLENGE: Try to the put the image somewhere else on the screen than at the origin.
  
  // load an audio resource
  NSBundle *mainBundle = [NSBundle mainBundle];
  NSError *err;
  NSURL *sosumiURL = [NSURL fileURLWithPath:[mainBundle pathForResource:@"sosumi" ofType:@"wav"]];
  player = [[AVAudioPlayer alloc] initWithContentsOfURL:sosumiURL error:&err];
  if(!player)
  {
    NSLog(@"%@", [err localizedDescription]);
  }
}


- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning];
}


- (void)viewDidUnload 
{
  if(imageView)
  {
    [imageView release];
    imageView = nil;
  }
}


- (IBAction)animate:(id)sender
{
  [UIView beginAnimations:@"grow" context:NULL]; 
  if(!toggle)
  {
    toggle = YES;
    imageView.frame = CGRectMake(0.0f, 0.0f, 320.0f, 400.0f);
  }
  else
  {
    toggle = NO;
    imageView.frame = originalFrame;
  }
  [UIView commitAnimations];
}


- (IBAction)playAudio:(id)sender
{
  if(player) [player play];
}


- (void)dealloc 
{
  [super dealloc];
}

@end
