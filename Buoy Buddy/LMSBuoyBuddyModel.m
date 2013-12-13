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

+ (instancetype) sharedModel {
    static LMSBuoyBuddyModel *_sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // code to be executed once - thread safe version!
        _sharedModel = [[self alloc] init];
    });
    
    return _sharedModel;
}

- (id)init
{
    self =[super init];
    _bouyDataSources= [NSMutableDictionary dictionaryWithCapacity:4];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/44097.spec" forKey:@"Block Island Buoy"];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/44017.spec" forKey:@"Montauk Point Buoy"];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/46221.spec" forKey:@"Santa Monica Bay Buoy"];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/46025.spec" forKey:@"Santa Monica Basin Buoy"];
    
    return self;
}

- (NSString *) getBouyDataSource: (NSString *) keyForBuoyDataSource
{
    return [_bouyDataSources objectForKey:keyForBuoyDataSource];
}

@end
