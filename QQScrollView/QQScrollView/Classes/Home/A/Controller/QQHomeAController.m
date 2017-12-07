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
#import "QQHomeWebViewController.h"
#import "QQAListViewModel.h"

@interface QQHomeAController ()<SDCycleScrollViewDelegate>

/// TableHeaderView
@property (nonatomic, strong) QQHomeAHeaderView *headerView;
/// ItemCount
@property (nonatomic, assign) NSInteger itemCount;
/// AListViewModel
@property (nonatomic, strong) QQAListViewModel *aListViewModel;

@end

@implementation QQHomeAController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemCount = 6;
    [self setupUI];
    [self loadBannerData];
    [self loadItemListData];
}

#pragma mark - Load Data
/**
 * loadBannerData
 */
- (void)loadBannerData {
    
    NSArray *imageArray = @[
                            @"http://cms-bucket.nosdn.127.net/33156f2ed6cf4ab9a8bf39dad457a92020171206162953.jpeg",
                            @"http://cms-bucket.nosdn.127.net/ff74bcc1ae6c483ebff0702258b7573920171206155939.jpeg",
                            @"http://cms-bucket.nosdn.127.net/33840c5aee5f4037a1e270b65b0ef1c620171206094236.jpeg"
                            ];
    NSArray *titleArray = @[
                            @"第一张图片",
                            @"第二张图片",
                            @"第三张图片"
                            ];
    self.headerView.cycleScrollView.imageURLStringsGroup = imageArray;
    self.headerView.cycleScrollView.titlesGroup = titleArray;
}

- (void)loadItemListData {
    
    [self.aListViewModel loadItemListCompletion:^(BOOL isSuccessed) {
        if (!isSuccessed) {
            NSLog(@"无数据");
        }
        self.itemCount = self.aListViewModel.itemList.count;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }];
}

//- (void)loadNewData {
//
////    self.itemCount = 7;
////
////    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
////    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
////
////    [self.tableView.mj_header endRefreshing];
//}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.cycleScrollView.delegate = self;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSArray *urlArray = @[
                          @"http://3g.163.com/news/17/1206/11/D4VGUKP2000189FH.html",
                          @"http://3g.163.com/news/17/1206/12/D4VMI5EC000187VE.html",
                          @"http://3g.163.com/news/17/1206/14/D4VTS0E40001875P.html"
                          ];
    
    QQHomeWebViewController *vc = [[QQHomeWebViewController alloc] init];
    vc.title = @"标题";
    vc.urlString = urlArray[index];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        QQHomeAaCell *cell = [QQHomeAaCell qq_homeAaCellWithTableView:tableView itemCount:self.itemCount];
        return cell;
        
    } else if (indexPath.row == 1) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
        
    } else {
        
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        if (self.itemCount <= 4) {
            return 100;
        } else {
            return 200;
        }
        
    } else if (indexPath.row == 1) {
        return 44;
    } else if (indexPath.row == 2) {
        return 200;
    } else {
        return 44;
    }
}

#pragma mark - Getters and Setters
- (QQHomeAHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[QQHomeAHeaderView alloc] init];
    }
    return _headerView;
}

- (QQAListViewModel *)aListViewModel {
    if (_aListViewModel == nil) {
        _aListViewModel = [[QQAListViewModel alloc] init];
    }
    return _aListViewModel;
}

@end
