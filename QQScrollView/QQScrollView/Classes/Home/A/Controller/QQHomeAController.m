//
//  QQHomeAController.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAController.h"
#import "QQHomeAHeaderView.h"
#import "QQHomeAaCell.h"
#import <SDCycleScrollView.h>

@interface QQHomeAController ()

/// TableHeaderView
@property (nonatomic, strong) QQHomeAHeaderView *headerView;

@end

@implementation QQHomeAController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadBannerData];
}

#pragma mark - Load Data
/**
 * loadBannerData
 */
- (void)loadBannerData {
    
    NSArray *array = @[
                       @"qq_cycle_test",
                       @"qq_cycle_placeholder",
                       ];
    NSArray *titleArray = @[
                            @"第一张图片",
                            @"第二张图片"
                            ];
    self.headerView.cycleScrollView.imageURLStringsGroup = array;
    self.headerView.cycleScrollView.titlesGroup = titleArray;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.tableView.tableHeaderView = self.headerView;
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



#pragma mark - Getters and Setters
- (QQHomeAHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[QQHomeAHeaderView alloc] init];
    }
    return _headerView;
}

@end
