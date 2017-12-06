//
//  QQHomeAController.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAController.h"
#import "QQHomeTableView.h"
#import "QQHomeAHeaderView.h"
#import "QQHomeAaCell.h"
#import <SDCycleScrollView.h>

@interface QQHomeAController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) QQHomeTableView *tableView;
/// TableHeaderView
@property (nonatomic, strong) QQHomeAHeaderView *headerView;

@end

@implementation QQHomeAController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

#pragma mark - Load Data
- (void)loadData {
    
    NSArray *array = @[
                       @"qq_cycle_test",
                       @"qq_cycle_placeholder",
                       ];
    self.headerView.cycleScrollView.imageURLStringsGroup = array;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headerView;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
//    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//    [self.tableView addSubview:refreshControl];
}

- (void)loadNewData {
    
    NSLog(@"aaaaa");
    
    sleep(5);
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQHomeAaCell *cell = [QQHomeAaCell qq_homeAaCellWithTableView:tableView];
    
    cell.textLabel.text = @"aaaddd";
    
    return cell;
}

#pragma mark - UITableViewDelegate
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    QQHomeAHeaderView *headerView = [QQHomeAHeaderView qq_homeAHeaderViewWithTableView:tableView];
//
//    headerView.backgroundColor = [UIColor redColor];
//
//    return headerView;
//}

#pragma mark - Getters and Setters
- (QQHomeTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[QQHomeTableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (QQHomeAHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[QQHomeAHeaderView alloc] init];
    }
    return _headerView;
}

@end
