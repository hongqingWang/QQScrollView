//
//  QQNewsAudioCell.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsAudioCell.h"
#import <Masonry.h>
#import "UILabel+QQ.h"

@interface QQNewsAudioCell ()

/// 图像
@property (nonatomic, strong) UIImageView *newsImageView;
/// 标题
@property (nonatomic, strong) UILabel *newsTitlelabel;
/// Cell
@property (nonatomic, strong) UIView *carve;

@end

@implementation QQNewsAudioCell

+ (instancetype)qq_newsAudioCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQNewsAudioCell";
    QQNewsAudioCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQNewsAudioCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        //        UIImageView *imageView = [[UIImageView alloc] init];
        //        imageView.image = [UIImage imageNamed:@"qq_news_cell_background_placeholder"];
        //        cell.backgroundView = imageView;
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
    [self addSubview:self.newsTitlelabel];
    [self addSubview:self.carve];
    
    [self.newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-16);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(80);
        make.bottom.equalTo(self).offset(-8);
    }];
    [self.newsTitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self.newsImageView.mas_left).offset(-16);
    }];
    [self.carve mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(0.3);
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

- (UILabel *)newsTitlelabel {
    if (_newsTitlelabel == nil) {
        _newsTitlelabel = [[UILabel alloc] init];
        [_newsTitlelabel qq_setText:@"视角|一位九旬老人对疾病与死亡的感悟，是否震撼到你？对疾病与死亡的感悟" lineSpacing:6];
        _newsTitlelabel.textColor = [UIColor darkGrayColor];
        _newsTitlelabel.font = [UIFont systemFontOfSize:16];
        _newsTitlelabel.numberOfLines = 2;
    }
    return _newsTitlelabel;
}

- (UIView *)carve {
    if (_carve == nil) {
        _carve = [[UIView alloc] init];
        _carve.backgroundColor = [UIColor lightGrayColor];
    }
    return _carve;
}

@end
