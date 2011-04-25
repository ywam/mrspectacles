//
//  NSManagedObjectContext+FetchAdditions.h
//
//  Created by Matt Gallagher on 26/02/07.
//  Copyright 2007 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

@interface NSManagedObjectContext (FetchAdditions)

- (NSArray *)fetchObjectArrayForRequest:(NSFetchRequest *)request;
- (NSArray *)fetchObjectArrayForEntityName:(NSString *)newEntityName
	withPredicate:(id)stringOrPredicate, ...;
- (NSFetchRequest *)fetchRequestForEntityName:(NSString *)newEntityName;

@end
