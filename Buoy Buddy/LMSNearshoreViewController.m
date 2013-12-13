//
//  LMSNearshoreViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/13/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//
//spinazzo@usc.edu
#import "LMSNearshoreViewController.h"
#import "LMSBuoyBuddyModel.h"

@interface LMSNearshoreViewController ()

@property (strong, nonatomic) LMSBuoyBuddyModel *buoyBuddyModel;
@property (nonatomic, weak) NSString *buoyName;
@property (weak, nonatomic) IBOutlet UIImageView *nearshoreImageView;
@property (weak, nonatomic) IBOutlet UILabel *sliderNumber;
@property (weak,nonatomic) NSArray *nearshoreImages;
@property (weak, nonatomic) IBOutlet UISlider *sliderPostion;

@end
@implementation LMSNearshoreViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _buoyBuddyModel = [LMSBuoyBuddyModel sharedModel];
    if ([_buoyName isEqual: @"Block Island Buoy"])
        _nearshoreImages=[_buoyBuddyModel getBouyNearshoreSources:@"Rhode Island Nearshore"];
    else if ([_buoyName isEqual: @"Montauk Point Buoy"])
        _nearshoreImages=[_buoyBuddyModel getBouyNearshoreSources:@"Montauk Nearshore"];
    else if ([_buoyName isEqual: @"Santa Monica Bay Buoy"])
        _nearshoreImages=[_buoyBuddyModel getBouyNearshoreSources:@"South LA Nearshore"];
    else if ([_buoyName isEqual: @"Santa Monica Basin Buoy"])
        _nearshoreImages=[_buoyBuddyModel getBouyNearshoreSources:@"North LA Nearshore"];

    [_nearshoreImageView setImage:[_nearshoreImages objectAtIndex:0]];
    self.sliderNumber.text =@"1";
}

- (void) setBuoyName:(NSString*) name
{
    _buoyName=name;
    
    
}



- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int numberAsInt = (int) (slider.value + 0.5f);
    NSString *newText = [[NSString alloc]
                         initWithFormat:@"%d", numberAsInt];
    self.sliderNumber.text = newText;
    [_nearshoreImageView setImage:[_nearshoreImages objectAtIndex:numberAsInt-1]];
    
}

@end
