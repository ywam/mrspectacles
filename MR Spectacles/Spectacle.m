//
//  Spectacle.m
//  MR Spectacles
//
//  Created by Code Cafe on 3/15/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import "Spectacle.h"


@implementation Spectacle
@synthesize tint, frame, comments, bf;
@synthesize sid, bin, sphr, cylr, axisr, sphl, cyll, axisl;
@synthesize oc, eyesize, bridge, add, nc, re, le, qrgc;


- (void)dealloc {
    [tint release];
    tint = nil;    
    [frame release];
    frame = nil;    
    [comments release];
    comments = nil;    
    [bf release];
    bf = nil;    
    [super dealloc];
}

- (id)initWithSid:(NSInteger)asid bin:(NSInteger)abin {
    if ((self = [super init])) {
        sid = asid;
        bin = abin;
    }
    return self;
}

@end
