//
//  ManagedObjectContextTestHelper.h
//  Spectacles
//
//  Created by Code Cafe on 3/24/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SpecTestHelper : NSObject {
}

-(id)initWithModelName:(NSString *)name;
-(NSString *)getFileContentsFromBundle:(NSString *)filename;

@property (nonatomic, retain) NSManagedObjectModel *model;
@property (nonatomic, retain) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, retain) NSPersistentStore *store;
@property (nonatomic, retain) NSManagedObjectContext *context;

@end