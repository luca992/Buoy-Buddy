//
//  LMSBuoyDataTabBarViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/12/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//

#import "LMSBuoyDataTabBarViewController.h"

@interface LMSBuoyDataTabBarViewController ()
    
@property (nonatomic, weak) NSString *buoyName;
@property (strong, nonatomic) IBOutlet UITabBar *buoyDetailTabBar;

@end

@implementation LMSBuoyDataTabBarViewController

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
    [[[self viewControllers] objectAtIndex:0] setBuoyName:_buoyName];
    [[[self viewControllers] objectAtIndex:1] setBuoyName:_buoyName];
    [[[self viewControllers] objectAtIndex:2] setBuoyName:_buoyName];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setBuoyName:(NSString*) name
{
    _buoyName=name;
    
}



@end
