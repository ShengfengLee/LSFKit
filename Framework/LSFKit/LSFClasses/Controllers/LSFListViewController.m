//
//  LSFListViewController.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFListViewController.h"

@interface LSFListViewController ()

@end

@implementation LSFListViewController


/**
 *  集成刷新控件
 */
- (void)setupRefresh:(UIScrollView *)scrollView
  withHeaderCallBack:(void (^)())headerCallback
   andFooterCallback:(void (^)())footerCallBack
{
    [self addHeader:scrollView withCallback:headerCallback];
    [self addFooter:scrollView withCallback:footerCallBack];
}

- (void)addHeader:(UIScrollView *)scrollView
     withCallback:(void (^)())callback
{
    _scrollView = scrollView;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:callback];
    
    /*
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:callback];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 5; i++) {
        NSString *title = [NSString stringWithFormat:@"loading_%zd", i];
        UIImage *image = [UIImage imageNamed:title];
        [idleImages addObject:image];
    }
    
    NSTimeInterval duration = 0.5;
    [header setImages:idleImages duration:duration forState:MJRefreshStateIdle];
    [header setImages:idleImages duration:duration forState:MJRefreshStatePulling];
    [header setImages:idleImages duration:duration forState:MJRefreshStateRefreshing];
    //*/
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    
    _scrollView.mj_header = header;
}

- (void)addFooter:(UIScrollView *)scrollView
     withCallback:(void (^)())callback
{
    _scrollView = scrollView;
    
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:callback];
    //    MJDIYAotuGifFooter *footer = [MJDIYAotuGifFooter footerWithRefreshingBlock:callback];
    
    
    
    _scrollView.mj_footer = footer;
    
}

- (void)endRefreshing
{
    [_scrollView.mj_header endRefreshing];
    [_scrollView.mj_footer endRefreshing];
}

//处理刷新控件底部显示
- (void)endRefreshingWithDataArray:(NSArray *)dataArray andTotalCount:(NSInteger)count
{
    [_scrollView.mj_header endRefreshing];
    //当数据加载完毕的时候
    if (dataArray.count < count) {
        /** 提示没有更多的数据 */
        [_scrollView.mj_footer endRefreshingWithNoMoreData];
    }
    else
    {
        /** 重置没有更多的数据（消除没有更多数据的状态） */
        [_scrollView.mj_footer resetNoMoreData];
    }
    
}

- (BOOL)isRefreshing
{
    if ([_scrollView.mj_header isRefreshing] || [_scrollView.mj_footer isRefreshing]) {
        return YES;
    }
    return NO;
    //    return [_scrollView isRefreshing];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
