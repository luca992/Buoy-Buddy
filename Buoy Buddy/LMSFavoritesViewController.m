//
//  LMSViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/11/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//
//spinazzo@usc.edu
#import "LMSFavoritesViewController.h"
#import "LMSBuoyBuddyModel.h"
#import "LMSBuoyDataTabBarViewController.h"

@interface LMSFavoritesViewController ()

@property (strong, nonatomic) IBOutlet UITableView *favoritesTable;
@property (strong, nonatomic) LMSBuoyBuddyModel *buoyBuddyModel;
@property (nonatomic,strong) NSArray *parsedBuoyData;
@end

@implementation LMSFavoritesViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   self.buoyBuddyModel = [LMSBuoyBuddyModel sharedModel];
    
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FavoritesCell";
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleSubtitle
                             reuseIdentifier:CellIdentifier];
    // Configure the cell...
    
    if (indexPath.row==0)
    {
        _parsedBuoyData = [_buoyBuddyModel getParsedBuoyData:@"Block Island Buoy"];
        cell.textLabel.text =[NSString stringWithFormat:@"Block Island Buoy"];
        NSString *subtitle = [NSString stringWithFormat:@"%@ %@",[NSString stringWithFormat:@"Swell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:36], [_parsedBuoyData objectAtIndex:37],[_parsedBuoyData objectAtIndex:40]],[NSString stringWithFormat:@"WindSwell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:38], [_parsedBuoyData objectAtIndex:39],[_parsedBuoyData objectAtIndex:41]]];

        cell.detailTextLabel.text = subtitle;
    }
    if (indexPath.row==1)
    {
        _parsedBuoyData = [_buoyBuddyModel getParsedBuoyData:@"Santa Monica Bay Buoy"];
        cell.textLabel.text =[NSString stringWithFormat:@"Santa Monica Bay Buoy"];
        NSString *subtitle = [NSString stringWithFormat:@"%@ %@",[NSString stringWithFormat:@"Swell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:36], [_parsedBuoyData objectAtIndex:37],[_parsedBuoyData objectAtIndex:40]],[NSString stringWithFormat:@"WindSwell: %@ @%@ sec from %@", [_parsedBuoyData objectAtIndex:38], [_parsedBuoyData objectAtIndex:39],[_parsedBuoyData objectAtIndex:41]]];
        
        cell.detailTextLabel.text = subtitle;
    }

        return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.favoritesTable indexPathForSelectedRow];
    LMSBuoyDataTabBarViewController *detailViewController = segue.destinationViewController;
    if (path.row==0)
        [detailViewController setBuoyName:@"Block Island Buoy"];
    if (path.row==1)
        [detailViewController setBuoyName:@"Santa Monica Bay Buoy"];
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"BouyDataTabBarSegue" sender:self];
     
}

@end
