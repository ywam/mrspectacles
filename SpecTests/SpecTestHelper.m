//
//  ManagedObjectContextTestHelper.m
//  Spectacles
//
//  Created by Code Cafe on 3/24/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import "SpecTestHelper.h"

@implementation SpecTestHelper
@synthesize model, coordinator, store, context;

-(NSString *)getFileContentsFromBundle:(NSString *)filename {
    NSString *resource, *type, *filepath, *contentString;
    NSError *error;
    NSArray *fileparts = [filename componentsSeparatedByString: @"."];
    
    resource = [fileparts objectAtIndex:0];
    type = [fileparts objectAtIndex:1];
    filepath = [[NSBundle mainBundle] pathForResource:resource ofType:type];

    contentString = [NSString stringWithContentsOfFile:filepath
                                          encoding:NSUTF8StringEncoding
                                             error:&error];
    if (contentString == nil) {
        NSLog(@"Error reading file at %@\n%@",
              filepath, [error localizedFailureReason]);
    }

    resource = type = filepath = nil;
    return contentString;
}

-(id)initWithModelName:(NSString *)name {
    static NSString *testTargetBundle = @"SpecTests";
    
    if ((self = [super init])) {
        NSBundle *testsBundle;
        for (NSBundle *bundle in [NSBundle allBundles]) {
            NSLog(@"%@",[bundle objectForInfoDictionaryKey:@"CFBundleExecutable"]);
            if ([[bundle objectForInfoDictionaryKey:@"CFBundleExecutable"] isEqualToString:testTargetBundle]) {
                testsBundle = bundle;
                break;
            }
        }
        NSString *modelResourcePath = [testsBundle pathForResource:name ofType:@"momd"];
        NSURL *modelURL = [NSURL fileURLWithPath:modelResourcePath];
        self.model = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] autorelease];
        self.coordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model] autorelease];
        self.store = [coordinator addPersistentStoreWithType: NSInMemoryStoreType
                                               configuration: nil
                                                         URL: nil
                                                     options: nil 
                                                       error: NULL];
        
        self.context = [[[NSManagedObjectContext alloc] init] autorelease];
        self.context.persistentStoreCoordinator = coordinator;        
    }
    
    return self;
}

-(void)dealloc {
    [context release];
    [store release];
    [coordinator release];
    [model release];
    [super dealloc];
}
@end