//
//  LMSBuoyDataViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/12/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//

#import "LMSBuoyDataViewController.h"
#import "LMSCell.h"
#import "LMSBuoyBuddyModel.h"
@interface LMSBuoyDataViewController ()

@property (strong, nonatomic) LMSBuoyBuddyModel *buoyBuddyModel;
@property (nonatomic,strong) NSArray *parsedBuoyData;
@property (nonatomic, weak) NSString *buoyName;
@property (nonatomic,strong) NSArray *chartHeaders;
@end

@implementation LMSBuoyDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.buoyBuddyModel = [LMSBuoyBuddyModel sharedModel];
    _chartHeaders = [NSArray arrayWithObjects:@"MM/DD", @"Time", @"WVHT", @"SwH", @"SwP", @"WWH", @"WWP", @"SwD", @"WWD", @"STEEP",@"APD",@"MWD", nil];
    
    NSError *err = nil;

        NSString *url = [[self.buoyBuddyModel getBouyDataSource:_buoyName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *buoyData = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:&err];
        if(err != nil) {
            //HANDLE ERROR HERE
        }
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
        NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
        
        NSArray *parts = [buoyData componentsSeparatedByCharactersInSet:whitespaces];
        NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
        buoyData = [filteredArray componentsJoinedByString:@" "];
        _parsedBuoyData = [buoyData componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    

}
- (void) setBuoyName:(NSString*) name
{
    _buoyName=name;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return 12;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LMSCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"oldBuoyDataCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:244/255.0f green:254/255.0f blue:255/255.0f alpha:1.0f];
    if (indexPath.section==0)
    {
        [cell setText:[_chartHeaders objectAtIndex:indexPath.row]];

    }
    else{
        if (indexPath.row==0)
            [cell setText:[NSString stringWithFormat:@"%@/%@", [_parsedBuoyData objectAtIndex:31+indexPath.row+(15*(indexPath.section-1))], [_parsedBuoyData objectAtIndex:31+indexPath.row+1+(15*(indexPath.section-1))]]];
        else if (indexPath.row==1){
            [cell setText:[NSString stringWithFormat:@"%@:%@", [_parsedBuoyData objectAtIndex:31+indexPath.row+1+(15*(indexPath.section-1))], [_parsedBuoyData objectAtIndex:31+indexPath.row+2+(15*(indexPath.section-1))]]];
        }
        else if (indexPath.row>1)
            [cell setText:[_parsedBuoyData objectAtIndex:31+indexPath.row+2+(15*(indexPath.section-1))]];
            
    }
    return cell;
}

@end
