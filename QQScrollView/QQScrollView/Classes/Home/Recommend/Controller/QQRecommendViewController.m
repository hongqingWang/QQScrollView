//
//  QQRecommendViewController.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQRecommendViewController.h"
#import "QQRecommendCell.h"
#import "QQRecommendListViewModel.h"
#import "QQHomeTableView.h"

@interface QQRecommendViewController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) QQHomeTableView *tableView;
/// RecommendListViewModel
@property (nonatomic, strong) QQRecommendListViewModel *recommendListViewModel;

@end

@implementation QQRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

#pragma mark - Load Data
- (void)loadData {
    
    [self.recommendListViewModel loadNewsDataCompletion:^(BOOL isSuccessed) {

        if (!isSuccessed) {
            NSLog(@"%s 没有请求到数据", __FUNCTION__);
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
    return self.recommendListViewModel.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQRecommendCell *cell = [QQRecommendCell recommendCellWithTableView:tableView];
    cell.viewModel = self.recommendListViewModel.newsList[indexPath.row];
    return cell;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self tableView];
}

#pragma mark - Getters and Setters
- (QQHomeTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[QQHomeTableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 100;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (QQRecommendListViewModel *)recommendListViewModel {
    if (_recommendListViewModel == nil) {
        _recommendListViewModel = [[QQRecommendListViewModel alloc] init];
    }
    return _recommendListViewModel;
}

@end
