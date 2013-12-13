//
//  LMSBuoyBuddyModel.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/12/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//

#import "LMSBuoyBuddyModel.h"
@interface LMSBuoyBuddyModel ()
@property (strong, nonatomic) NSMutableDictionary *bouyDataSources;
@end
@implementation LMSBuoyBuddyModel


- (id)init
{
    self =[super init];
    [bouyDataSources setObject:<#(id)#> forKey:@"Block Island Buoy"];
    
    return self;
}



@end
