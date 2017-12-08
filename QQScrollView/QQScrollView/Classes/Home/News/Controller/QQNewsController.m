//
//  QQNewsController.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsController.h"
#import "QQNewsCell.h"
#import "QQRecommendListViewModel.h"
#import "QQHomeTableView.h"

@interface QQNewsController ()

/// RecommendListViewModel
@property (nonatomic, strong) QQRecommendListViewModel *recommendListViewModel;

@end

@implementation QQNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
}

#pragma mark - Load Data
- (void)loadNewData {
    
    [self.recommendListViewModel loadNewsDataCompletion:^(BOOL isSuccessed) {
        
        if (!isSuccessed) {
            NSLog(@"%s 没有请求到数据", __FUNCTION__);
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recommendListViewModel.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQNewsCell *cell = [QQNewsCell qq_newsCellWithTableView:tableView];
    cell.viewModel = self.recommendListViewModel.newsList[indexPath.row];
    return cell;
}

- (QQRecommendListViewModel *)recommendListViewModel {
    if (_recommendListViewModel == nil) {
        _recommendListViewModel = [[QQRecommendListViewModel alloc] init];
    }
    return _recommendListViewModel;
}

@end
