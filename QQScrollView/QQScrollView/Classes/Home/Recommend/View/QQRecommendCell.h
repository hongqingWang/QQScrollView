//
//  QQRecommendCell.h
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQRecommendViewModel;

@interface QQRecommendCell : UITableViewCell

/// RecommendViewModel
@property (nonatomic, strong) QQRecommendViewModel *viewModel;

+ (instancetype)recommendCellWithTableView:(UITableView *)tableView;

@end
