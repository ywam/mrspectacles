//
//  Spectacle.h
//  MR Spectacles
//
//  Created by Code Cafe on 3/15/11.
//  Copyright 2011 CodeCafe, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Spectacle : NSObject {

}

@property(copy) NSString *tint, *frame, *comments, *bf;
@property NSInteger sid, bin;
@property float sphr, cylr, axisr, sphl, cyll, axisl;
@property float oc, eyesize, bridge, add, nc, re, le, qrgc;

- (id)initWithSid:(NSInteger)asid bin:(NSInteger)abin;

@end
