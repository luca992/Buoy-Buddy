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
@property (weak, nonatomic) IBOutlet UIImageView *tideImageView;

@end
@implementation LMSTidesViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    _buoyBuddyModel = [LMSBuoyBuddyModel sharedModel];
    if ([_buoyName isEqual: @"Santa Monica Bay Buoy"]){
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tile.surfline.com/dashboard/dashboards/4/9//tidebar_4900_0_ft_en.png"]]];
    [_tideImageView setImage:image];
    }
    if ([_buoyName isEqual: @"Santa Monica Basin Buoy"]){
        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tile.surfline.com/dashboard/dashboards/4/9//tidebar_4900_0_ft_en.png"]]];
        [_tideImageView setImage:image];
    }
    if ([_buoyName isEqual: @"Block Island Buoy"]){
        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tile.surfline.com/dashboard/dashboards/5/1//tidebar_5107_0_ft_en.png"]]];
        [_tideImageView setImage:image];
    }
    if ([_buoyName isEqual: @"Montauk Point Buoy"]){
        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://tile.surfline.com/dashboard/dashboards/4/2//tidebar_4268_0_ft_en.png"]]];
        [_tideImageView setImage:image];
    }

    
    
}

- (void) setBuoyName:(NSString*) name
{
    _buoyName=name;
    
}
@end
