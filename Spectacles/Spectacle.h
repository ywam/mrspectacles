//
//  Spectacle.h
//  Spectacles
//
//  Created by Code Cafe on 3/24/11.
//  Copyright (c) 2011 CodeCafe, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Spectacle : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * cylr;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSNumber * bin;
@property (nonatomic, retain) NSNumber * add;
@property (nonatomic, retain) NSString * frame;
@property (nonatomic, retain) NSNumber * sphl;
@property (nonatomic, retain) NSNumber * eyesize;
@property (nonatomic, retain) NSNumber * bridge;
@property (nonatomic, retain) NSNumber * axisr;
@property (nonatomic, retain) NSString * tint;
@property (nonatomic, retain) NSNumber * cyll;
@property (nonatomic, retain) NSNumber * sphr;
@property (nonatomic, retain) NSNumber * axisl;
@property (nonatomic, retain) NSNumber * prog;
@property (nonatomic, retain) NSDate * timeAdded;

@end
