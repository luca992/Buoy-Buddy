//
//  LMSTidesViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/13/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//

#import "LMSTidesViewController.h"
#import "LMSBuoyBuddyModel.h"

@interface LMSTidesViewController ()

@property (strong, nonatomic) LMSBuoyBuddyModel *buoyBuddyModel;
@property (nonatomic, weak) NSString *buoyName;

@end
@implementation LMSTidesViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    _buoyBuddyModel = [LMSBuoyBuddyModel sharedModel];
    
}

- (void) setBuoyName:(NSString*) name
{
    _buoyName=name;
    
}
@end
