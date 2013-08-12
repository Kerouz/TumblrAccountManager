//
//  tmbViewController.m
//  TumblrAccountManager
//
//  Created by Apple on 12/08/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "tmbViewController.h"
#import "tmbAppDelegate.h"
#import "tmbAccount.h"

@interface tmbViewController ()

@end

@implementation tmbViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tumblr Accounts";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    tmbAppDelegate *delegate =(tmbAppDelegate *)
    [[UIApplication sharedApplication] delegate];
    accounts = delegate.accounts;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]
                initWithFrame:CGRectZero
                reuseIdentifier:@"cell"];
    }
    
    NSLog(@"indexPath.ro = %d, cities.count = %d", indexPath.row, accounts.count);
    if (indexPath.row < accounts.count) {
        tmbAccount *thisAccount = [accounts objectAtIndex:indexPath.row];
        cell.textLabel.text = thisAccount.accountName;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.editingAccessoryType = UITableViewCellAccessoryNone;
        
    } else {
        cell.textLabel.text = @"Add New Account...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    NSInteger count = accounts.count;
    if (self.editing) {
        count = count + 1;
    }
    return count;
}

- (void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editing == UITableViewCellEditingStyleDelete) {
        [accounts removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tmbAppDelegate *delegate = (tmbAppDelegate *)
    [[UIApplication sharedApplication] delegate];
/*    if (indexPath.row < accounts.count && !self.editing) {
        CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
        [delegate.navController pushViewController:city animated:YES];
    }
    if (indexPath.row == cities.count && self.editing) {
        AddCityController *addCity = [[AddCityController alloc] init];
        [delegate.navController pushViewController:addCity animated:YES];
    }
    /*    City *thisCity = [cities objectAtIndex:indexPath.row];
     UIAlertView *alert = [[UIAlertView alloc]initWithTitle:thisCity.cityName message:thisCity.cityDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
     [alert show];
     */
    
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < accounts.count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}




@end
