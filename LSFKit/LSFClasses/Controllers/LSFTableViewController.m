//
//  LSFTableViewController.m
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import "LSFTableViewController.h"

@interface LSFTableViewController ()

@end

@implementation LSFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}
#pragma mark
#pragma mark - 右滑返回开关
- (void)setPopRecognizerEnable:(BOOL)popRecognizerEnable{
    UINavigationController *navigationController = self.navigationController;
    if ([navigationController isKindOfClass:[LSFNavigationController class]]) {
        LSFNavigationController *bbNavigation = (LSFNavigationController *)navigationController;
        bbNavigation.popRecognizer.enabled = popRecognizerEnable;
    }
    else{
        UIGestureRecognizer *popRecognizer = navigationController.interactivePopGestureRecognizer;
        popRecognizer.enabled = popRecognizerEnable;
    }
}

- (BOOL)popRecognizerEnable{
    UINavigationController *navigationController = self.navigationController;
    if ([navigationController isKindOfClass:[LSFNavigationController class]]) {
        LSFNavigationController *bbNavigation = (LSFNavigationController *)navigationController;
        return bbNavigation.popRecognizer.enabled;
    }
    else{
        UIGestureRecognizer *popRecognizer = navigationController.interactivePopGestureRecognizer;
        return popRecognizer.enabled;
    }
}


#pragma mark 旋转
// New Autorotation support. IOS(6_0);
- (BOOL)shouldAutorotate
{
    return YES;
}

//IOS(6_0)
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
    
}
//// Returns interface orientation masks. IOS(6_0);
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
