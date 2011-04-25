//
//  EntryReceiver.m
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

#import "EntryReceiver.h"

@implementation EntryReceiver

//
// initWithContext:
//
// Parameters:
//    aContext - the context into which records will be added.
//    entityName - the name of the NSEntityDescription to use for new
//		managedObjects added to the context.
//
// returns the initialized object.
//
- (id)initWithContext:(NSManagedObjectContext *)aContext
	entityName:(NSString *)entityName
{
	self = [super init];
	if (self)
	{
		context = [aContext retain];
		entityDescription =
			[[NSEntityDescription
				entityForName:entityName
				inManagedObjectContext:context]
			retain];
	}
	return self;
}

//
// dealloc
//
// Releases instance memory.
//
- (void)dealloc
{
	[context release];
	[entityDescription release];
	[super dealloc];
}


//
// receiveRecord:
//
// Receives a row from the CSVParser
//
// Parameters:
//    aRecord - the row
//
- (void)receiveRecord:(NSDictionary *)aRecord
{
	NSManagedObject *managedObject =
		[[[NSManagedObject alloc]
			initWithEntity:entityDescription
			insertIntoManagedObjectContext:context]
		autorelease];
	NSDictionary *attributesByName = [entityDescription attributesByName];	
	
	for (NSString *key in aRecord)
	{
		NSAttributeDescription *attributeDescription =
			[attributesByName objectForKey:key];
		if (attributeDescription)
		{
			switch([attributeDescription attributeType])
			{
			case NSInteger64AttributeType:
			case NSInteger32AttributeType:
			case NSInteger16AttributeType:
				[managedObject
					setValue:
						[NSNumber numberWithLongLong:[[aRecord objectForKey:key] longLongValue]]
					forKey:key];
				break;
			case NSDecimalAttributeType:
				[managedObject
					setValue:
						[NSDecimalNumber decimalNumberWithString:[aRecord objectForKey:key]]
					forKey:key];
				break;
			case NSDoubleAttributeType:
			case NSFloatAttributeType:
				[managedObject
					setValue:
						[NSNumber numberWithDouble:[[aRecord objectForKey:key] doubleValue]]
					forKey:key];
				break;
			default:
				[managedObject setValue:[aRecord objectForKey:key] forKey:key];
				break;
			}
		}
	}
}

@end
