//
//  LSFActionShowViewController.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFActionShowViewController.h"
#import "LSFActionShowTableViewCell.h"

@interface LSFActionShowViewController ()
<UITableViewDelegate,
UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;

@end

@implementation LSFActionShowViewController

+ (instancetype)actionShowViewCotroller{
    return [self viewControllerWithStoryboardName:@"LSFActionShowViewController" identifier:@"LSFActionShowViewController"];
}


+ (instancetype)actionShowViewControllerArray:(NSArray *)array
                            presentController:(UIViewController *)presentController{
    LSFActionShowViewController *viewController = [self actionShowViewCotroller];
    viewController.dataArray = array;
    viewController.presentController = presentController;
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableViewHeightConstraint.constant = self.dataArray.count * 131 - 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonClick:(UIButton *)sender {
    [self close];
}

#pragma mark
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger count = self.dataArray.count;
    return count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 1;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSFActionShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSFActionShowTableViewCell"];
    
    NSArray *modelArray;
    if (self.dataArray.count > indexPath.section) {
        modelArray = self.dataArray[indexPath.section];
    }
    
    cell.dataArray = modelArray;
    cell.selectCompleteHandel = self.selectCompleteHandel;
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
