//
//  SimpleCommand.h
//
//  Created by Cristiano Caldas on 2012-02-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "MainViewController.h"
@interface SimpleCommand : NSObject
{
	
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) BOOL waitFinish;
@property(nonatomic, retain) uint id;
@property(nonatomic, retain) NSDate *date;

-(void)setup;
-(void)executeCommand:(NSString *)name waitFinish:(BOOL)waitFinish;

@end