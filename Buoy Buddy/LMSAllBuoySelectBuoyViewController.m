//
//  LMSAllBuoySelectBuoyViewController.m
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/11/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//

#import "LMSAllBuoySelectBuoyViewController.h"
#import "LMSBuoyDataTabBarViewController.h"

@interface LMSAllBuoySelectBuoyViewController ()
@property (strong, nonatomic) IBOutlet UITableView *buoyTable;
@property (nonatomic, weak) NSString *name;
@end

@implementation LMSAllBuoySelectBuoyViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void) setTableName:(NSString*) name
{
    _name=name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    if ([_name isEqual: @"Rhode Island"])
        return 2;
    if ([_name isEqual: @"California"])
        return 2;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BuoyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if ([_name isEqual: @"Rhode Island"]){
        if (indexPath.row==0)
            cell.textLabel.text =[NSString stringWithFormat:@"Block Island Buoy"];
        if (indexPath.row==1)
            cell.textLabel.text =[NSString stringWithFormat:@"Montauk Point Buoy"];
    }
    if ([_name isEqual: @"California"]){
       
        if (indexPath.row==0)
            cell.textLabel.text =[NSString stringWithFormat:@"Santa Monica Bay Buoy"];
        if (indexPath.row==1)
            cell.textLabel.text =[NSString stringWithFormat:@"Santa Monica Basin Buoy"];
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
    NSIndexPath *path = [self.buoyTable indexPathForSelectedRow];
    LMSBuoyDataTabBarViewController *detailViewController = segue.destinationViewController;
    if ([_name isEqual:@"Rhode Island"])
    {
        if (path.row==0)
            [detailViewController setBuoyName:@"Block Island Buoy"];
        if (path.row==1)
            [detailViewController setBuoyName:@"Montauk Point Buoy"];

    }
    if ([_name isEqual:@"California"])
    {
        if (path.row==0)
            [detailViewController setBuoyName:@"Santa Monica Bay Buoy"];
        if (path.row==1)
            [detailViewController setBuoyName:@"Santa Monica Basin Buoy"];
        
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
