//
//  QQNewsCell.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsCell.h"
#import "QQNewsViewModel.h"

@interface QQNewsCell ()

/// 图片
@property (nonatomic, strong) UIImageView *newsImageView;
/// 标题
@property (nonatomic, strong) UILabel *newsTitleLabel;
/// 来源
@property (nonatomic, strong) UILabel *sourceLabel;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 浏览量
@property (nonatomic, strong) UILabel *dayNumLabel;

@end

@implementation QQNewsCell

- (void)setViewModel:(QQNewsViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self.newsImageView sd_setImageWithURL:viewModel.imgsrc_url placeholderImage:[UIImage imageNamed:@"qq_news_placeholder"]];
    self.newsTitleLabel.attributedText = viewModel.title_attr_string;
    self.sourceLabel.text = viewModel.source_string;
    self.dayNumLabel.text = viewModel.daynum_string;
}

+ (instancetype)qq_newsCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQNewsCell";
    QQNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    
    [self addSubview:self.newsImageView];
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.sourceLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.dayNumLabel];
    
    [self.newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-16);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(80);
        make.bottom.equalTo(self).offset(-8);
    }];
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self.newsImageView.mas_left).offset(-16);
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-8);
        make.left.equalTo(self.newsTitleLabel);
        make.width.mas_equalTo(60);
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
        [_newsTitleLabel qq_setText:@"视角|一位九旬老人对疾病与死亡的感悟，是否震撼到你？对疾病与死亡的感悟" lineSpacing:6];
        _newsTitleLabel.textColor = [UIColor darkGrayColor];
        _newsTitleLabel.font = [UIFont systemFontOfSize:16];
        _newsTitleLabel.numberOfLines = 2;
    }
    return _newsTitleLabel;
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
