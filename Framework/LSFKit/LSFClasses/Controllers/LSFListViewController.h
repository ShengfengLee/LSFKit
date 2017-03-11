//
//  LSFListViewController.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface LSFListViewController : LSFViewController
{
@public
    UIScrollView *_scrollView;
    NSInteger _limit;
}

/*!
 *  是否正在刷新网络数据
 */
@property (nonatomic, assign, readonly) BOOL isRefreshing;
@property (nonatomic, assign) NSInteger limit;  //分页

///数据源
@property (nonatomic, strong) NSMutableArray *dataArray;

/**
 *  集成刷新控件
 */
- (void)setupRefresh:(UIScrollView *)scrollView
  withHeaderCallBack:(void (^)())headerCallback
   andFooterCallback:(void (^)())footerCallBack;

///只要头部刷新
- (void)addHeader:(UIScrollView *)scrollView
     withCallback:(void (^)())callback;

///只要尾部刷新
- (void)addFooter:(UIScrollView *)scrollView
     withCallback:(void (^)())callback;

/**
 *  让上拉、下拉刷新头部控件停止刷新状态
 */
- (void)endRefreshing;

@end
