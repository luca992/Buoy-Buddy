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
@property (strong, nonatomic) NSMutableDictionary *bouyNearshoreSources;
@property (strong, nonatomic) NSMutableArray* RINearshoreImages;
@property (strong, nonatomic) NSMutableArray* NYMontaukImages;
@property (strong, nonatomic) NSMutableArray* CANorthLAImages;
@property (strong, nonatomic) NSMutableArray* CASouthLAImages;

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
    _RINearshoreImages = [[NSMutableArray alloc] init];
    _NYMontaukImages = [[NSMutableArray alloc] init];
    _CASouthLAImages = [[NSMutableArray alloc] init];
    _CANorthLAImages = [[NSMutableArray alloc] init];
    

    _bouyDataSources= [NSMutableDictionary dictionaryWithCapacity:4];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/44097.spec" forKey:@"Block Island Buoy"];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/44017.spec" forKey:@"Montauk Point Buoy"];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/46221.spec" forKey:@"Santa Monica Bay Buoy"];
    [_bouyDataSources setObject:@"http://www.ndbc.noaa.gov/data/realtime2/46025.spec" forKey:@"Santa Monica Basin Buoy"];
    
    _bouyNearshoreSources= [NSMutableDictionary dictionaryWithCapacity:4];
    //=====================================================================================
        
    
    
    return self;
}

- (NSString *) getBouyDataSource: (NSString *) keyForBuoyDataSource
{
    return [_bouyDataSources objectForKey:keyForBuoyDataSource];
}
- (NSArray *) getParsedBuoyData: (NSString*) buoyName
{
    
    NSError *err = nil;
    
    NSString *url = [[self getBouyDataSource:buoyName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *buoyData = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:&err];
    if(err != nil) {
        //HANDLE ERROR HERE
    }
    NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    
    NSArray *parts = [buoyData componentsSeparatedByCharactersInSet:whitespaces];
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
    buoyData = [filteredArray componentsJoinedByString:@" "];
    return [buoyData componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

}
- (NSArray *) getBouyNearshoreSources: (NSString *) keyForBuoyNearshoreSources
{
        UIImage *image;
    if ([keyForBuoyNearshoreSources isEqual:@"Rhode Island Nearshore"]){
    NSArray *NearshoreLinks = [NSArray arrayWithObjects:@"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_01.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_02.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_03.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_04.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_05.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_06.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_07.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_08.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_09.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_10.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_11.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_12.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_13.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Rhode_Island_14.png",   nil];
    
    for (int x=0; x < [NearshoreLinks count]; x++){
        image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NearshoreLinks objectAtIndex:((NSInteger)x)]]]];
        [self.RINearshoreImages addObject:image];
    }
    [_bouyNearshoreSources setObject:self.RINearshoreImages forKey:@"Rhode Island Nearshore"];
    }
    
    if ([keyForBuoyNearshoreSources isEqual:@"Montauk Nearshore"]){
        NSArray *NearshoreLinks = [NSArray arrayWithObjects: @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_01.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_02.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_03.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_04.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_05.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_06.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_07.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_08.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_09.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_10.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_11.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_12.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_13.png", @"http://charts.cdn-surfline.com/nearshores/NJ_NY_Montauk_14.png",   nil];
        
        for (int x=0; x < [NearshoreLinks count]; x++){
            image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NearshoreLinks objectAtIndex:((NSInteger)x)]]]];
            [_NYMontaukImages addObject:image];
        }
        [_bouyNearshoreSources setObject:_NYMontaukImages forKey:@"Montauk Nearshore"];
    }
    
    if ([keyForBuoyNearshoreSources isEqual:@"North LA Nearshore"]){
        NSArray *NearshoreLinks = [NSArray arrayWithObjects: @"http://charts.cdn-surfline.com/nearshores/lanorth_01.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_02.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_03.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_04.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_05.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_06.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_07.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_08.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_09.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_10.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_11.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_12.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_13.png", @"http://charts.cdn-surfline.com/nearshores/lanorth_14.png", nil];
        
        for (int x=0; x < [NearshoreLinks count]; x++){
            image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NearshoreLinks objectAtIndex:((NSInteger)x)]]]];
            [_CANorthLAImages addObject:image];
        }
        [_bouyNearshoreSources setObject:_CANorthLAImages forKey:@"North LA Nearshore"];
    }
    
    if ([keyForBuoyNearshoreSources isEqual:@"South LA Nearshore"]){
        NSArray *NearshoreLinks = [NSArray arrayWithObjects: @"http://charts.cdn-surfline.com/nearshores/palosv_01.png", @"http://charts.cdn-surfline.com/nearshores/palosv_02.png", @"http://charts.cdn-surfline.com/nearshores/palosv_03.png", @"http://charts.cdn-surfline.com/nearshores/palosv_04.png", @"http://charts.cdn-surfline.com/nearshores/palosv_05.png", @"http://charts.cdn-surfline.com/nearshores/palosv_06.png", @"http://charts.cdn-surfline.com/nearshores/palosv_07.png", @"http://charts.cdn-surfline.com/nearshores/palosv_08.png", @"http://charts.cdn-surfline.com/nearshores/palosv_09.png", @"http://charts.cdn-surfline.com/nearshores/palosv_10.png", @"http://charts.cdn-surfline.com/nearshores/palosv_11.png", @"http://charts.cdn-surfline.com/nearshores/palosv_12.png", @"http://charts.cdn-surfline.com/nearshores/palosv_13.png", @"http://charts.cdn-surfline.com/nearshores/palosv_14.png", nil];
        
        for (int x=0; x < [NearshoreLinks count]; x++){
            image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NearshoreLinks objectAtIndex:((NSInteger)x)]]]];
            [_CASouthLAImages addObject:image];
        }
        [_bouyNearshoreSources setObject:_CASouthLAImages forKey:@"South LA Nearshore"];
    }
    
    
    
    
    
    
    
    
    
    return [_bouyNearshoreSources objectForKey:keyForBuoyNearshoreSources];
}

@end
