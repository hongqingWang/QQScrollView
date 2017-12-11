//
//  QQNewsController.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsController.h"
#import "QQNewsCell.h"
#import "QQNewsNoImageCell.h"
#import "QQNewsThreeImageCell.h"
#import "QQNewsListViewModel.h"
#import "QQNewsViewModel.h"
#import "QQNews.h"

@interface QQNewsController ()

/// NewsListViewModel
@property (nonatomic, strong) QQNewsListViewModel *newsListViewModel;

@end

@implementation QQNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Load Data
- (void)loadNewData {
    
    [self.newsListViewModel loadNewsDataCompletion:^(BOOL isSuccessed) {
        
        if (!isSuccessed) {
            NSLog(@"%s 没有请求到数据", __FUNCTION__);
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsListViewModel.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQNewsViewModel *viewModel = self.newsListViewModel.newsList[indexPath.row];
    NSInteger count = viewModel.news.replyCount % 3;
    
    if (count == 0) {
        
        QQNewsNoImageCell *cell = [QQNewsNoImageCell qq_newsNoImageCellWithTableView:tableView];
        cell.viewModel = viewModel;
        return cell;
    
    } else if (count == 1) {
      
        QQNewsCell *cell = [QQNewsCell qq_newsCellWithTableView:tableView];
        cell.viewModel = viewModel;
        return cell;
        
    } else {
        
        QQNewsThreeImageCell *cell = [QQNewsThreeImageCell qq_newsThreeImageCellWithTableView:tableView];
        cell.viewModel = viewModel;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQNewsViewModel *viewModel = self.newsListViewModel.newsList[indexPath.row];
    return viewModel.cellHeight;
}

#pragma mark - Getters and Setters
- (QQNewsListViewModel *)newsListViewModel {
    if (_newsListViewModel == nil) {
        _newsListViewModel = [[QQNewsListViewModel alloc] init];
    }
    return _newsListViewModel;
}

@end
