//
//  QQNewsController.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsController.h"
#import "QQNewsCell.h"
#import "QQNewsListViewModel.h"
#import "QQHomeTableView.h"

@interface QQNewsController ()

/// RecommendListViewModel
@property (nonatomic, strong) QQNewsListViewModel *newsListViewModel;

@end

@implementation QQNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
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
    
    QQNewsCell *cell = [QQNewsCell qq_newsCellWithTableView:tableView];
    cell.viewModel = self.newsListViewModel.newsList[indexPath.row];
    return cell;
}

- (QQNewsListViewModel *)newsListViewModel {
    if (_newsListViewModel == nil) {
        _newsListViewModel = [[QQNewsListViewModel alloc] init];
    }
    return _newsListViewModel;
}

@end
