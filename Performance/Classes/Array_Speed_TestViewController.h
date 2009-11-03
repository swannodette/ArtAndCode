//
//  Array_Speed_TestViewController.h
//  Array Speed Test
//
//  Created by Mehmet Akten on 05/02/2009.
//  Copyright MSA Visuals Ltd. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "MyNSObject.h"
#include "MyCppObject.h"

@interface Array_Speed_TestViewController : UIViewController 
{
	int									numberOfItems;				// number of items in array
	MyCppObject					*cArray;							// normal c array
	NSMutableArray			*nsArray;							// ns array
	double							machTimerMillisMult;	// multiplier to convert mach_absolute_time() to milliseconds
	

	IBOutlet	UISlider	*sliderCount;
	IBOutlet	UILabel		*labelCount;

	IBOutlet	UILabel		*labelResults;
}

-(IBAction) doNSArrayPerformSelector:(id)sender;
-(IBAction) doNSArrayForLoop:(id)sender;
-(IBAction) doCArray:(id)sender;

-(IBAction) sliderChanged:(id)sender;

@end


