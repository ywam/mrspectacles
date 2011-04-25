//
//  MyTestCase.m
//  Spectacles
//
//  Created by Code Cafe on 3/25/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import "MyTestCase.h"
#import "CSVParser.h"
#import "EntryReceiver.h"
#import "NSManagedObjectContext+FetchAdditions.h"

@implementation MyTestCase
@synthesize moc;

// By default NO, but if you have a UI test or test dependent on running on the main thread return YES
- (BOOL)shouldRunOnMainThread
{
    return NO;
}

// Run at start of all tests in the class
- (void)setUpClass
{
}

// Run at end of all tests in the class
- (void)tearDownClass
{
}

// Run before each test method
- (void)setUp
{
    self.moc = [SpecTestHelper alloc];
    [self.moc initWithModelName:@"Spectacles"];
    
}

// Run after each test method
- (void)tearDown
{
    self.moc = nil;
}

#pragma mark -
#pragma mark Unit Tests


- (void)testFoo {       
    NSString *a = @"bar";
    GHTestLog(@"I can log to the GHUnit test console: %@", a);
    
    // Assert a is not NULL, with no custom error description
    GHAssertNotNULL(a, nil);
    
    // Assert equal objects, add custom error description
    NSString *b = @"bar";
    GHAssertEqualObjects(a, b, @"A custom error message. a should be equal to: %@.", b);
}

- (void)testLoadFiveFromCSV
{
    CSVParser *parser =
    [[[CSVParser alloc] initWithString:[self.moc getFileContentsFromBundle:@"Five_Specs.csv"]
                             separator:@","
                             hasHeader:YES
                            fieldNames:[NSArray arrayWithObjects:nil]] autorelease];
    
    EntryReceiver *receiver = [[[EntryReceiver alloc] initWithContext:self.moc.context
                                                           entityName:@"Spectacle"] autorelease];
    
    [parser parseRowsForReceiver:receiver selector:@selector(receiveRecord:)];
    
    NSNumber *count = [[self.moc.context fetchObjectArrayForEntityName:@"Spectacle"
                                                         withPredicate:nil] count];
    GHTestLog(@"Number of Rows %i", (int)count);
    NSLog(@"%i",(int)count);
    GHAssertEqualObjects((int)count,
                         5,
                         @"The number of Spectacles should be 5.");
}

- (void)testLoadManyFromCSV
{
    CSVParser *parser =
    [[[CSVParser alloc] initWithString:[self.moc getFileContentsFromBundle:@"Some_Specs.csv"]
                             separator:@","
                             hasHeader:YES
                            fieldNames:[NSArray arrayWithObjects:nil]] autorelease];
    
    EntryReceiver *receiver = [[[EntryReceiver alloc] initWithContext:self.moc.context
                                                           entityName:@"Spectacle"] autorelease];
    
    [parser parseRowsForReceiver:receiver selector:@selector(receiveRecord:)];
    
    NSNumber *count = [[self.moc.context fetchObjectArrayForEntityName:@"Spectacle"
                                                         withPredicate:nil] count];
    GHTestLog(@"Number of Rows %i", (int)count);
    GHAssertEqualObjects((int)count,
                         11,
                         @"The number of Spectacles should be 11.");
}

- (void)testLoadAllFromCSV
{
    CSVParser *parser =
    [[[CSVParser alloc] initWithString:[self.moc getFileContentsFromBundle:@"All_Specs.csv"]
                             separator:@","
                             hasHeader:YES
                            fieldNames:[NSArray arrayWithObjects:nil]] autorelease];
    
    EntryReceiver *receiver = [[[EntryReceiver alloc] initWithContext:self.moc.context
                                                           entityName:@"Spectacle"] autorelease];
    
    [parser parseRowsForReceiver:receiver selector:@selector(receiveRecord:)];
    
    NSNumber *count = [[self.moc.context fetchObjectArrayForEntityName:@"Spectacle"
                                                         withPredicate:nil] count];
    GHTestLog(@"Number of Rows %i", (int)count);
    GHAssertEqualObjects((int)count,
                         2134,
                         @"The number of Spectacles should be 2134.");
}

//- (void)testLoadAllFromCSV
//{
//    CSVParser *parser = [CSVParser alloc];
//    [[parser initWithString:[self.moc getFileContentsFromBundle:@"Spectacles.csv"]
//                 separator:@","
//                 hasHeader:YES
//                fieldNames:[NSArray arrayWithObjects:nil]] autorelease];
//    
//    EntryReceiver *receiver = [EntryReceiver alloc];
//    [[receiver initWithContext:self.moc.context
//                    entityName:@"Spectacle"] autorelease];
//    
//    [parser parseRowsForReceiver:receiver selector:@selector(receiveRecord:)];
//    NSArray *results = [self.moc.context fetchObjectArrayForEntityName:@"Spectacle"
//                                                         withPredicate:nil];
//    NSLog("%@",[results count]);
//}

@end