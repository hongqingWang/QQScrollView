//
//  QQNewsCell.h
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQRecommendViewModel;


@interface QQNewsCell : UITableViewCell

/// RecommendViewModel
@property (nonatomic, strong) QQRecommendViewModel *viewModel;

+ (instancetype)qq_newsCellWithTableView:(UITableView *)tableView;

@end
