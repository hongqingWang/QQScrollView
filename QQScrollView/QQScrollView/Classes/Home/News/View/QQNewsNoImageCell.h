//
//  QQNewsNoImageCell.h
//  QQScrollView
//
//  Created by Mac on 11/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQNewsViewModel;

@interface QQNewsNoImageCell : UITableViewCell

/// NewsViewModel
@property (nonatomic, strong) QQNewsViewModel *viewModel;

+ (instancetype)qq_newsNoImageCellWithTableView:(UITableView *)tableView;

@end
