//
//  LMSBuoyBuddyModel.h
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/12/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//spinazzo@usc.edu

#import <Foundation/Foundation.h>

@interface LMSBuoyBuddyModel : NSObject
- (NSString*)getBouyDataSource: (NSString*)keyForBuoyDataSource;
- (NSArray *) getBouyNearshoreSources: (NSString *) keyForBuoyNearshoreSources;
- (NSArray *) getParsedBuoyData: (NSString*) buoyName;
+ (instancetype) sharedModel;
@end
