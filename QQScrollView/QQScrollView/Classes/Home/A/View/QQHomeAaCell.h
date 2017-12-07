//
//  QQHomeAaCell.h
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQHomeViewModel;

@protocol QQHomeAaCellDelegate <NSObject>

- (void)tap:(UITapGestureRecognizer *)tap;

@end

@interface QQHomeAaCell : UITableViewCell

/// Delegate
@property (nonatomic, weak) id <QQHomeAaCellDelegate> delegate;

+ (instancetype)qq_homeAaCellWithTableView:(UITableView *)tableView viewModelArray:(NSArray *)viewModelArray;

@end
