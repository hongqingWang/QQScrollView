//
//  QQNewsAudioController.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsAudioController.h"
#import "QQNewsAudioCell.h"

@interface QQNewsAudioController ()

@end

@implementation QQNewsAudioController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView.
    NSLog(@"%@", self.view.subviews);
    
}

#pragma mark - Load Data
- (void)loadNewData {
    
    NSLog(@"Audio");
    sleep(3);
    [self.tableView.mj_header endRefreshing];
//    UITableView *tableView =
//    [self.tableView.mj_header endRefreshing];
}
//- (void)loadData {
//
//    NSLog(@"aaaaa");
//    self load
//    sleep(5);
//    [self.tableView.mj_header endRefreshing];
//}

- (void)loadMoreData {
    
    sleep(2);
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQNewsAudioCell *cell = [QQNewsAudioCell qq_newsAudioCellWithTableView:tableView];
    return cell;
}

@end
