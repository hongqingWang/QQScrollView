//
//  QQRecommendCell.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQRecommendCell.h"
#import <Masonry.h>

@interface QQRecommendCell ()

/// 图片
@property (nonatomic, strong) UIImageView *newsImageView;
/// 标题
@property (nonatomic, strong) UILabel *newsTitleLabel;
/// 副标题
@property (nonatomic, strong) UILabel *newsSubTitleLabel;
/// 跟帖数
@property (nonatomic, strong) UILabel *replyCountLabel;

@end

@implementation QQRecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUI];
    }
    return self;
}

+ (instancetype)recommendCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQRecommendCell";
    QQRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self addSubview:self.newsImageView];
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.newsSubTitleLabel];
    [self addSubview:self.replyCountLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(16);
        make.bottom.equalTo(self).offset(-8);
        make.width.mas_equalTo(112);
    }];
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newsImageView);
        make.left.equalTo(_newsImageView.mas_right).offset(8);
        make.right.equalTo(self).offset(-16);
    }];
    [self.newsSubTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newsTitleLabel.mas_bottom).offset(8);
        make.left.equalTo(_newsTitleLabel);
        make.right.equalTo(_newsTitleLabel);
    }];
    [self.replyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-8);
        make.right.equalTo(self).offset(-16);
    }];
}

#pragma mark - Getters and Setters
- (UIImageView *)newsImageView {
    if (_newsImageView == nil) {
        _newsImageView = [[UIImageView alloc] init];
        _newsImageView.image = [UIImage imageNamed:@"qq_news_placeholder"];
    }
    return _newsImageView;
}

- (UILabel *)newsTitleLabel {
    if (_newsTitleLabel == nil) {
        _newsTitleLabel = [[UILabel alloc] init];
        _newsTitleLabel.text = @"标题";
        _newsTitleLabel.textColor = [UIColor darkGrayColor];
    }
    return _newsTitleLabel;
}

- (UILabel *)newsSubTitleLabel {
    if (_newsSubTitleLabel == nil) {
        _newsSubTitleLabel = [[UILabel alloc] init];
        _newsSubTitleLabel.text = @"副标题";
        _newsSubTitleLabel.textColor = [UIColor lightGrayColor];
        _newsSubTitleLabel.font = [UIFont systemFontOfSize:14];
        _newsSubTitleLabel.numberOfLines = 2;
    }
    return _newsSubTitleLabel;
}

- (UILabel *)replyCountLabel {
    if (_replyCountLabel == nil) {
        _replyCountLabel = [[UILabel alloc] init];
        _replyCountLabel.text = @"跟帖数";
        _replyCountLabel.textColor = [UIColor darkGrayColor];
        _replyCountLabel.font = [UIFont systemFontOfSize:12];
        _replyCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _replyCountLabel;
}

@end