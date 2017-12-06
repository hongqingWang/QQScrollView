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

@interface QQHomeAController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) QQHomeTableView *tableView;

@end

@implementation QQHomeAController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    self.tableView.tableHeaderView = [[QQHomeAHeaderView alloc] init];
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self.view addSubview:self.tableView];
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

@end
