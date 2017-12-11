//
//  QQNewsNoImageCell.m
//  QQScrollView
//
//  Created by Mac on 11/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsNoImageCell.h"
#import "QQNewsViewModel.h"

@interface QQNewsNoImageCell ()

/// 标题
@property (nonatomic, strong) UILabel *newsTitleLabel;
/// 来源
@property (nonatomic, strong) UILabel *sourceLabel;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 浏览量
@property (nonatomic, strong) UILabel *dayNumLabel;

@end

@implementation QQNewsNoImageCell

- (void)setViewModel:(QQNewsViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.newsTitleLabel.attributedText = viewModel.title_attr_string;
    self.sourceLabel.text = viewModel.source_string;
    self.dayNumLabel.text = viewModel.daynum_string;
}

+ (instancetype)qq_newsNoImageCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQNewsNoImageCell";
    QQNewsNoImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQNewsNoImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.sourceLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.dayNumLabel];
    
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-10);
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
- (UILabel *)newsTitleLabel {
    if (_newsTitleLabel == nil) {
        _newsTitleLabel = [[UILabel alloc] init];
        [_newsTitleLabel qq_setText:@"视角|一位九旬老人对疾病与死亡的感悟，是否震撼到你？对疾病与死亡的感悟" lineSpacing:6];
        _newsTitleLabel.textColor = [UIColor darkGrayColor];
        _newsTitleLabel.font = [UIFont systemFontOfSize:16];
        _newsTitleLabel.numberOfLines = 0;
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
