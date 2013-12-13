//
//  LMSSecondViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/2/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//
//spinazzo@usc.edu
#import "LMSMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "LMSBuoyBuddyModel.h"


@interface LMSMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) LMSBuoyBuddyModel *buoyBuddyModel;
@property (nonatomic,strong) NSArray *parsedBuoyData;
@end

@implementation LMSMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.buoyBuddyModel = [LMSBuoyBuddyModel sharedModel];
    CLLocationCoordinate2D SantaMonicaBasin = CLLocationCoordinate2DMake(33.4458, -119.310);
    CLLocationCoordinate2D SantaMonicaBay = CLLocationCoordinate2DMake(33.854, -118.633);
    CLLocationCoordinate2D BlockIsland = CLLocationCoordinate2DMake(40.981, -71.117);
    CLLocationCoordinate2D Montauk = CLLocationCoordinate2DMake(40.694, -72.048);

    self.mapView.delegate = self;
    
    _parsedBuoyData = [_buoyBuddyModel getParsedBuoyData:@"Santa Monica Basin Buoy"];

    MKPointAnnotation *SantaMonicaBasinPoint = [[MKPointAnnotation alloc] init];
    SantaMonicaBasinPoint.coordinate= SantaMonicaBasin;
    SantaMonicaBasinPoint.title =[NSString stringWithFormat:@"Swell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:36], [_parsedBuoyData objectAtIndex:37],[_parsedBuoyData objectAtIndex:40]];
    SantaMonicaBasinPoint.subtitle = [NSString stringWithFormat:@"WindSwell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:38], [_parsedBuoyData objectAtIndex:39],[_parsedBuoyData objectAtIndex:41]];
    [self.mapView addAnnotation:SantaMonicaBasinPoint];
    
    _parsedBuoyData = [_buoyBuddyModel getParsedBuoyData:@"Santa Monica Bay Buoy"];
    
    MKPointAnnotation *SantaMonicaBayPoint = [[MKPointAnnotation alloc] init];
    SantaMonicaBayPoint.coordinate= SantaMonicaBay;
    SantaMonicaBayPoint.title = [NSString stringWithFormat:@"Swell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:36], [_parsedBuoyData objectAtIndex:37],[_parsedBuoyData objectAtIndex:40]];
    SantaMonicaBayPoint.subtitle =[NSString stringWithFormat:@"WindSwell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:38], [_parsedBuoyData objectAtIndex:39],[_parsedBuoyData objectAtIndex:41]];
    [self.mapView addAnnotation:SantaMonicaBayPoint];
    
    _parsedBuoyData = [_buoyBuddyModel getParsedBuoyData:@"Block Island Buoy"];
    
    MKPointAnnotation *BlockIslandPoint = [[MKPointAnnotation alloc] init];
    BlockIslandPoint.coordinate= BlockIsland;
    BlockIslandPoint.title = [NSString stringWithFormat:@"Swell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:36], [_parsedBuoyData objectAtIndex:37],[_parsedBuoyData objectAtIndex:40]];
    BlockIslandPoint.subtitle = [NSString stringWithFormat:@"WindSwell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:38], [_parsedBuoyData objectAtIndex:39],[_parsedBuoyData objectAtIndex:41]];
    [self.mapView addAnnotation:BlockIslandPoint];
    
    _parsedBuoyData = [_buoyBuddyModel getParsedBuoyData:@"Montauk Point Buoy"];
    
    MKPointAnnotation *MontaukPoint = [[MKPointAnnotation alloc] init];
    MontaukPoint.coordinate= Montauk;
    MontaukPoint.title = [NSString stringWithFormat:@"Swell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:36], [_parsedBuoyData objectAtIndex:37],[_parsedBuoyData objectAtIndex:40]];
    MontaukPoint.subtitle = [NSString stringWithFormat:@"WindSwell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:38], [_parsedBuoyData objectAtIndex:39],[_parsedBuoyData objectAtIndex:41]];
    [self.mapView addAnnotation:MontaukPoint];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}
@end
