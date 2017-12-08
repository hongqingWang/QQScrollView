//
//  QQNewsVideoController.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsVideoController.h"
#import "QQNewsVideoCell.h"
#import "QQNewsListViewModel.h"

@interface QQNewsVideoController ()

/// NewsListViewModel
@property (nonatomic, strong) QQNewsListViewModel *newsListViewModel;

@end

@implementation QQNewsVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 180;
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
    
    QQNewsVideoCell *cell = [QQNewsVideoCell qq_newsVideoCellWithTableView:tableView];
    cell.viewModel = self.newsListViewModel.newsList[indexPath.row];
    return cell;
}

#pragma mark - Getters and Setters
- (QQNewsListViewModel *)newsListViewModel {
    if (_newsListViewModel == nil) {
        _newsListViewModel = [[QQNewsListViewModel alloc] init];
    }
    return _newsListViewModel;
}

@end
