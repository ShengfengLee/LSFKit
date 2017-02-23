//
//  LSFActionShowTableViewCell.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFActionShowModel.h"

@interface LSFActionShowTableViewCell : UITableViewCell

@property (nonatomic, copy) void (^selectCompleteHandel)(LSFActionShowModel *model);
@property (nonatomic, strong) NSArray<LSFActionShowModel *> *dataArray;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
