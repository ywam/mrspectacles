//
//  EntryReceiver.h
//  CSVImporter
//
//  Created by Matt Gallagher on 2009/11/30.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

//#import <Cocoa/Cocoa.h>
#import <UIKit/UIKit.h> 

@interface EntryReceiver : NSObject
{
	NSManagedObjectContext *context;
	NSEntityDescription *entityDescription;
}

- (id)initWithContext:(NSManagedObjectContext *)aContext
	entityName:(NSString *)entityName;

@end
