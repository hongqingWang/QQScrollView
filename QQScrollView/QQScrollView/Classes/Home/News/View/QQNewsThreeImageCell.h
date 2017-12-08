//
//  QQNewsThreeImageCell.h
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQNewsViewModel;

@interface QQNewsThreeImageCell : UITableViewCell

/// NewsViewModel
@property (nonatomic, strong) QQNewsViewModel *viewModel;

+ (instancetype)qq_newsThreeImageCellWithTableView:(UITableView *)tableView;

@end
