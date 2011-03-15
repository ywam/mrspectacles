//
//  MR_SpectaclesAppDelegate.h
//  MR Spectacles
//
//  Created by Code Cafe on 3/15/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MR_SpectaclesViewController;

@interface MR_SpectaclesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MR_SpectaclesViewController *viewController;

@end
