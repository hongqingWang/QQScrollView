//
//  QQNewsThreeImageCell.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsThreeImageCell.h"
#import "QQNewsViewModel.h"

static CGFloat const margin = 6;
static CGFloat const imageHeight = 60;

@interface QQNewsThreeImageCell ()

/// 标题
@property (nonatomic, strong) UILabel *newsTitleLabel;
/// 图片
@property (nonatomic, strong) UIImageView *newsFirstImageView;
/// 图片
@property (nonatomic, strong) UIImageView *newsSecondImageView;
/// 图片
@property (nonatomic, strong) UIImageView *newsThirdImageView;
/// 来源
@property (nonatomic, strong) UILabel *sourceLabel;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 浏览量
@property (nonatomic, strong) UILabel *dayNumLabel;

@end

@implementation QQNewsThreeImageCell

- (void)setViewModel:(QQNewsViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self.newsFirstImageView sd_setImageWithURL:viewModel.imgsrc_url placeholderImage:[UIImage imageNamed:@"qq_news_placeholder"]];
    [self.newsSecondImageView sd_setImageWithURL:viewModel.imgsrc_url placeholderImage:[UIImage imageNamed:@"qq_news_placeholder"]];
    [self.newsThirdImageView sd_setImageWithURL:viewModel.imgsrc_url placeholderImage:[UIImage imageNamed:@"qq_news_placeholder"]];
    self.newsTitleLabel.attributedText = viewModel.title_attr_string;
    self.sourceLabel.text = viewModel.source_string;
    self.dayNumLabel.text = viewModel.daynum_string;
}

+ (instancetype)qq_newsThreeImageCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQNewsThreeImageCell";
    QQNewsThreeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQNewsThreeImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    
    CGFloat imageWidth = ([UIScreen mainScreen].bounds.size.width - (10 * 2) - (margin * 2)) / 3;
    
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.newsFirstImageView];
    [self addSubview:self.newsSecondImageView];
    [self addSubview:self.newsThirdImageView];
    [self addSubview:self.sourceLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.dayNumLabel];
    
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [self.newsFirstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.newsTitleLabel);
        make.height.mas_equalTo(imageHeight);
        make.width.mas_equalTo(imageWidth);
    }];
    [self.newsSecondImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.newsFirstImageView);
        make.left.equalTo(self.newsFirstImageView.mas_right).offset(margin);
        make.height.mas_equalTo(imageHeight);
        make.width.mas_equalTo(imageWidth);
    }];
    [self.newsThirdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.newsSecondImageView);
        make.left.equalTo(self.newsSecondImageView.mas_right).offset(margin);
        make.height.mas_equalTo(imageHeight);
        make.width.mas_equalTo(imageWidth);
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsFirstImageView.mas_bottom).offset(10);
        make.left.equalTo(self.newsFirstImageView);
        make.width.mas_equalTo(60);
        make.bottom.equalTo(self).offset(-10);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sourceLabel);
        make.left.equalTo(self.sourceLabel.mas_right);
        make.width.mas_equalTo(60);
    }];
    [self.dayNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel);
        make.left.equalTo(self.timeLabel.mas_right);
    }];
}

#pragma mark - Getters and Setters
- (UILabel *)newsTitleLabel {
    if (_newsTitleLabel == nil) {
        _newsTitleLabel = [[UILabel alloc] init];
        [_newsTitleLabel qq_setText:@"视角|一位九旬老人对疾病与死亡的感悟，是否震撼到你？对疾病与死亡的感悟" lineSpacing:6];
        _newsTitleLabel.textColor = [UIColor darkGrayColor];
        _newsTitleLabel.font = [UIFont systemFontOfSize:16];
        _newsTitleLabel.numberOfLines = 2;
    }
    return _newsTitleLabel;
}

- (UIImageView *)newsFirstImageView {
    if (_newsFirstImageView == nil) {
        _newsFirstImageView = [[UIImageView alloc] init];
        _newsFirstImageView.image = [UIImage imageNamed:@"qq_news_placeholder"];
    }
    return _newsFirstImageView;
}

- (UIImageView *)newsSecondImageView {
    if (_newsSecondImageView == nil) {
        _newsSecondImageView = [[UIImageView alloc] init];
        _newsSecondImageView.image = [UIImage imageNamed:@"qq_news_placeholder"];
    }
    return _newsSecondImageView;
}

- (UIImageView *)newsThirdImageView {
    if (_newsThirdImageView == nil) {
        _newsThirdImageView = [[UIImageView alloc] init];
        _newsThirdImageView.image = [UIImage imageNamed:@"qq_news_placeholder"];
    }
    return _newsThirdImageView;
}

- (UILabel *)sourceLabel {
    if (_sourceLabel == nil) {
        _sourceLabel = [[UILabel alloc] init];
        _sourceLabel.text = @"来源";
        _sourceLabel.textColor = [UIColor lightGrayColor];
        _sourceLabel.font = [UIFont systemFontOfSize:11];
    }
    return _sourceLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"21分钟前";
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:11];
    }
    return _timeLabel;
}

- (UILabel *)dayNumLabel {
    if (_dayNumLabel == nil) {
        _dayNumLabel = [[UILabel alloc] init];
        _dayNumLabel.text = @"1111";
        _dayNumLabel.textColor = [UIColor lightGrayColor];
        _dayNumLabel.font = [UIFont systemFontOfSize:11];
    }
    return _dayNumLabel;
}

@end
