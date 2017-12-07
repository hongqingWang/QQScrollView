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
#import "QQHomeListViewModel.h"
#import "QQHomeViewModel.h"
#import "QQHomeA.h"
#import "QQHomeAbCell.h"
#import "QQHomeAcCell.h"

@interface QQHomeAController ()<SDCycleScrollViewDelegate, QQHomeAaCellDelegate, QQHomeAbCellDelegate>

/// TableHeaderView
@property (nonatomic, strong) QQHomeAHeaderView *headerView;
/// QQHomeListViewModel
@property (nonatomic, strong) QQHomeListViewModel *homeListViewModel;

@end

@implementation QQHomeAController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    [self.homeListViewModel loadItemListCompletion:^(BOOL isSuccessed) {
        if (!isSuccessed) {
            NSLog(@"无数据");
        }
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

#pragma mark - QQHomeAaCellDelegate
/**
 * `Item`点击事件
 */
- (void)tap:(UITapGestureRecognizer *)tap {
    
    QQHomeViewModel *viewModel = self.homeListViewModel.itemList[tap.view.tag];
    QQHomeWebViewController *vc = [[QQHomeWebViewController alloc] init];
    vc.title = viewModel.homeA.title;
    vc.urlString = viewModel.homeA.url;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - QQHomeAbCellDelegate
- (void)didSelecteItemAtIndex:(NSInteger)index {
    
    QQHomeWebViewController *vc = [[QQHomeWebViewController alloc] init];
    vc.urlString = @"http://www.baidu.com";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 1;
    } else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        QQHomeAaCell *cell = [QQHomeAaCell qq_homeAaCellWithTableView:tableView viewModelArray:self.homeListViewModel.itemList];
        cell.delegate = self;
        return cell;
        
    } else if (indexPath.section == 1) {
        
        QQHomeAbCell *cell = [QQHomeAbCell qq_homeAbCellWithTableView:tableView];
        cell.delegate = self;
        NSArray *titleArray = @[
                                @"掌中佛1.0下线了！",
                                @"掌中佛2.0上线了！",
                                @"掌中佛3.0上线了！"
                                ];
        cell.notiCycleScrollView.titlesGroup = titleArray;
        return cell;
        
    } else if (indexPath.section == 2) {
      
        QQHomeAcCell *cell = [QQHomeAcCell qq_homeAcCellWithTableView:tableView];
        
        
        
        return cell;
        
    } else {
        
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (self.homeListViewModel.itemList.count <= 4) {
            return 100;
        } else {
            return 200;
        }
        
    } else if (indexPath.section == 1) {
        return 44;
    } else if (indexPath.section == 2) {
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

- (QQHomeListViewModel *)homeListViewModel {
    if (_homeListViewModel == nil) {
        _homeListViewModel = [[QQHomeListViewModel alloc] init];
    }
    return _homeListViewModel;
}

@end
