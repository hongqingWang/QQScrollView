//
//  QQNewsCell.h
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQNewsViewModel;

@interface QQNewsCell : UITableViewCell

/// NewsViewModel
@property (nonatomic, strong) QQNewsViewModel *viewModel;

+ (instancetype)qq_newsCellWithTableView:(UITableView *)tableView;

@end
