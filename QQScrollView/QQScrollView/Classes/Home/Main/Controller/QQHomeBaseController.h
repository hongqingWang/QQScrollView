//
//  QQHomeBaseController.h
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class UITableView;

@interface QQHomeBaseController : UIViewController<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) UITableView *tableView;

/**
 * 加载新数据(下拉刷新)
 */
- (void)loadNewData;

/**
 * 加载更多数据(上拉刷新)
 */
- (void)loadMoreData;

@end
