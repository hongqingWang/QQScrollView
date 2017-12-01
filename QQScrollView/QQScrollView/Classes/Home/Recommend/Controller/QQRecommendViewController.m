//
//  QQRecommendViewController.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQRecommendViewController.h"
#import "QQRecommendCell.h"

@interface QQRecommendViewController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation QQRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

#pragma mark - Load Data
- (void)loadData {
    
//    [self.newsListViewModel loadNewsDataCompletion:^(BOOL isSuccessed) {
//
//        if (!isSuccessed) {
//            NSLog(@"%s 没有请求到数据", __FUNCTION__);
//        }
//        [self.tableView reloadData];
//    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    //    return self.newsListViewModel.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQRecommendCell *cell = [QQRecommendCell recommendCellWithTableView:tableView];
//    cell.viewModel = self.newsListViewModel.newsList[indexPath.row];
    return cell;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self tableView];
}

#pragma mark - Getters and Setters
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 100;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
