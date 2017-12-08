//
//  QQNewsAudioCell.h
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQNewsViewModel;

@interface QQNewsAudioCell : UITableViewCell

/// NewsViewModel
@property (nonatomic, strong) QQNewsViewModel *viewModel;

+ (instancetype)qq_newsAudioCellWithTableView:(UITableView *)tableView;

@end
