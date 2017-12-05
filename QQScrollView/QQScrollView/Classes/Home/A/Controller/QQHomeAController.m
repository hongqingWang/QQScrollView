//
//  QQHomeAController.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAController.h"
#import "QQHomeTableView.h"

@interface QQHomeAController ()

/// TableView
@property (nonatomic, strong) QQHomeTableView *tableView;

@end

@implementation QQHomeAController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Getters and Setters
- (QQHomeTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[QQHomeTableView alloc] init];
    }
    return _tableView;
}

@end
