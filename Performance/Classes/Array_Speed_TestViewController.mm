//
//  Array_Speed_TestViewController.m
//  Array Speed Test
//
//  Created by Mehmet Akten on 05/02/2009.
//  Copyright MSA Visuals Ltd. 2009. All rights reserved.
//

#import "Array_Speed_TestViewController.h"

#include <mach/mach.h>
#include <mach/mach_time.h>

@implementation Array_Speed_TestViewController

- (void) viewDidLoad 
{
  [super viewDidLoad];
	cArray		= NULL;
	nsArray		= NULL;
	[self sliderChanged:sliderCount];
	mach_timebase_info_data_t info;
	mach_timebase_info(&info);
	machTimerMillisMult = (double)info.numer / ((double)info.denom * 1000000.0);
}


- (void) displayResult:(uint64_t)duration 
{
	double millis = duration * machTimerMillisMult;
	NSString *str = [[NSString alloc] initWithFormat:@"%f milliseconds", millis];
	[labelResults setText:str];
	[str release];
}


- (IBAction) doNSArrayForLoop:(id)sender 
{
	uint64_t startTime = mach_absolute_time();
	for(int i=0; i<numberOfItems; i++) {
		[[nsArray objectAtIndex:i] doSomething];
	}
	[self displayResult:mach_absolute_time() - startTime];
}


- (IBAction) doNSArrayPerformSelector:(id)sender 
{
	uint64_t startTime = mach_absolute_time();
	[nsArray makeObjectsPerformSelector:@selector(doSomething)];
	[self displayResult:mach_absolute_time() - startTime];
}


- (IBAction) doDirectMethod:(id)sender
{
	// get direct access to the instance method so it can be called as a normal C function ;)
	void (*doSomething)(id, SEL);
	SEL doSomethingSel = @selector(doSomething);
	doSomething = (void (*)(id, SEL))[MyNSObject instanceMethodForSelector:doSomethingSel];
	
	uint64_t startTime = mach_absolute_time();
	for(MyNSObject *obj in nsArray) {
		doSomething(obj, doSomethingSel);
	}
	[self displayResult:mach_absolute_time() - startTime];
}


- (IBAction) doCArray:(id)sender 
{
	uint64_t start = mach_absolute_time();
	for(int i=0; i<numberOfItems; i++) {
		cArray[i].doSomething();
	}
	[self displayResult:mach_absolute_time() - start];
}


- (void) allocateArrays 
{
	if(cArray) delete cArray;
	cArray = new MyCppObject[numberOfItems];
	[nsArray release];
	nsArray = [[NSMutableArray alloc] initWithCapacity:numberOfItems];
	for(int i=0; i<numberOfItems; i++) {
		cArray[i].f = random() * 1.0f/(RAND_MAX+1);
		MyNSObject *myObj = [[MyNSObject alloc] init];
		myObj.f = cArray[i].f;
		[nsArray addObject:myObj];
		[myObj release];
	}
}


- (IBAction) sliderChanged:(id)sender 
{
	numberOfItems = sliderCount.value;
	NSString *str = [[NSString alloc] initWithFormat:@"%i items", numberOfItems];
	[labelCount setText:str];
	[str release];
	[self allocateArrays];
}


- (void) dealloc 
{
	[nsArray release];
	if(cArray) delete cArray;
  [super dealloc];
}

@end
