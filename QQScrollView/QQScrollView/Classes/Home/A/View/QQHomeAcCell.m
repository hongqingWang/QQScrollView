//
//  QQHomeAcCell.m
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAcCell.h"

@interface QQHomeAcCell ()

/// View
@property (nonatomic, strong) UIView *view01;
/// View
@property (nonatomic, strong) UIView *view02;
/// View
@property (nonatomic, strong) UIView *view03;

@end

@implementation QQHomeAcCell

+ (instancetype)qq_homeAcCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQHomeAcCell";
    QQHomeAcCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQHomeAcCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    [self addSubview:self.view01];
    [self addSubview:self.view02];
    [self addSubview:self.view03];
    
    [self.view01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width / 2);
    }];
    [self.view02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.view01.mas_right);
        make.bottom.equalTo(self.view01.mas_centerY);
        make.right.equalTo(self);
    }];
    [self.view03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view02.mas_bottom);
        make.left.equalTo(self.view02);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
}

#pragma mark - Getters and Setters
- (UIView *)view01 {
    if (_view01 == nil) {
        _view01 = [[UIView alloc] init];
        _view01.backgroundColor = [UIColor qq_randomColor];
    }
    return _view01;
}

- (UIView *)view02 {
    if (_view02 == nil) {
        _view02 = [[UIView alloc] init];
        _view02.backgroundColor = [UIColor qq_randomColor];
    }
    return _view02;
}

- (UIView *)view03 {
    if (_view03 == nil) {
        _view03 = [[UIView alloc] init];
        _view03.backgroundColor = [UIColor qq_randomColor];
    }
    return _view03;
}

@end
