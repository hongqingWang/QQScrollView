//
//  QQNewsVideoController.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsVideoController.h"
#import "QQHomeTableView.h"
#import "QQNewsVideoCell.h"

@interface QQNewsVideoController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) QQHomeTableView *tableView;

@end

@implementation QQNewsVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
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
    
    QQNewsVideoCell *cell = [QQNewsVideoCell qq_newsVideoCellWithTableView:tableView];
    cell.textLabel.text = @"aaa";
    return cell;
}

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
