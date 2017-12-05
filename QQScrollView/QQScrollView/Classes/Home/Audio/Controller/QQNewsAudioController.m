//
//  QQNewsAudioController.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsAudioController.h"
#import "QQHomeTableView.h"
#import "QQNewsAudioCell.h"

@interface QQNewsAudioController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) QQHomeTableView *tableView;

@end

@implementation QQNewsAudioController

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
    
    QQNewsAudioCell *cell = [QQNewsAudioCell qq_newsAudioCellWithTableView:tableView];
    return cell;
}

#pragma mark - Getters and Setters
- (QQHomeTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[QQHomeTableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 200;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

@end
