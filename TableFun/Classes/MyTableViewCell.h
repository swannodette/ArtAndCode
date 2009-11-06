//
//  MyTableViewCell.h
//  TableFun
//
//  Created by David Nolen on 3/11/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTableViewCell : UITableViewCell 
{
  UILabel *name;
}

- (void) setData:(NSString*)nameString;

@end
