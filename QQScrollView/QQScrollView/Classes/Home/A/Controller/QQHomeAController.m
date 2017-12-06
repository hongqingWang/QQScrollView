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

@interface QQHomeAController ()<SDCycleScrollViewDelegate>

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
