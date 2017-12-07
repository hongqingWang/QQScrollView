//
//  QQHomeAbCell.m
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAbCell.h"
#import <SDCycleScrollView.h>

static CGFloat const notiCellHeight = 44;

@interface QQHomeAbCell ()<SDCycleScrollViewDelegate>

/// ImageView
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation QQHomeAbCell

+ (instancetype)qq_homeAbCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQHomeAbCell";
    QQHomeAbCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQHomeAbCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.notiCycleScrollView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(16);
    }];
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    if ([self.delegate respondsToSelector:@selector(didSelecteItemAtIndex:)]) {
        [self.delegate didSelecteItemAtIndex:index];
    }
}

#pragma mark - Getters and Setters
- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"qq_cycle_pagedot_selected"];
    }
    return _iconImageView;
}

- (SDCycleScrollView *)notiCycleScrollView {
    if (_notiCycleScrollView == nil) {
        NSArray *titleArray = @[
                                @"掌中佛1.0下线了！",
                                @"掌中佛2.0上线了！"
                                ];
        CGRect frame = CGRectMake(32, 0, [UIScreen mainScreen].bounds.size.width - 32, notiCellHeight);
        _notiCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
        _notiCycleScrollView.onlyDisplayText = YES;
        _notiCycleScrollView.backgroundColor = [UIColor whiteColor];
        _notiCycleScrollView.titlesGroup = titleArray;
        _notiCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
        _notiCycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
        _notiCycleScrollView.titleLabelTextColor = [UIColor darkGrayColor];
        _notiCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _notiCycleScrollView;
}

@end
