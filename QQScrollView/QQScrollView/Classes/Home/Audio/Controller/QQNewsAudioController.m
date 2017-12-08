//
//  QQNewsAudioController.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsAudioController.h"
#import "QQNewsAudioCell.h"
#import "QQNewsListViewModel.h"

@interface QQNewsAudioController ()

/// NewsListViewModel
@property (nonatomic, strong) QQNewsListViewModel *newsListViewModel;

@end

@implementation QQNewsAudioController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 200;
    
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

- (void)loadMoreData {
    
    sleep(1);
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsListViewModel.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQNewsAudioCell *cell = [QQNewsAudioCell qq_newsAudioCellWithTableView:tableView];
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
