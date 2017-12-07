//
//  QQHomeAbCell.h
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SDCycleScrollView;

@protocol QQHomeAbCellDelegate <NSObject>

- (void)didSelecteItemAtIndex:(NSInteger)index;

@end

@interface QQHomeAbCell : UITableViewCell

/// notiCycleScrollView
@property (nonatomic, strong) SDCycleScrollView *notiCycleScrollView;
/// QQHomeAbCellDelegate
@property (nonatomic, weak) id <QQHomeAbCellDelegate> delegate;

+ (instancetype)qq_homeAbCellWithTableView:(UITableView *)tableView;

@end
