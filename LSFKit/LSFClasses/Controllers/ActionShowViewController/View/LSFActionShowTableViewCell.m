//
//  LSFActionShowTableViewCell.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFActionShowTableViewCell.h"
#import "LSFActionShowCollectionViewCell.h"

@interface LSFActionShowTableViewCell ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@end

@implementation LSFActionShowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDataArray:(NSArray<LSFActionShowModel *> *)dataArray{
    _dataArray = dataArray;
    [self.collectionView reloadData];
}

#pragma mark
#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = 0;
    count = self.dataArray.count;
    return count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LSFActionShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSFActionShowCollectionViewCell" forIndexPath:indexPath];
    
    LSFActionShowModel *model;
    if (self.dataArray.count > indexPath.item) {
        model = self.dataArray[indexPath.item];
    }
    
    [cell setIconWithImageName:model.iconImageName title:model.name];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count > indexPath.item) {
        LSFActionShowModel *model;
        model = self.dataArray[indexPath.item];
        if (self.selectCompleteHandel) {
            self.selectCompleteHandel(model);
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
