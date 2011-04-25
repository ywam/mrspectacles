//
//  RootViewController.h
//  Spectacles
//
//  Created by Code Cafe on 3/22/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

#import <CoreData/CoreData.h>
#import "Spectacle.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {

}


@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (void)insertNewObject:(id)sender;

@end
