//
//  QQHomeAaCell.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAaCell.h"
#import "QQHomeViewModel.h"
#import "QQHomeA.h"

static CGFloat const kHomeAaCellMaxHeight = 200;

@implementation QQHomeAaCell

+ (instancetype)qq_homeAaCellWithTableView:(UITableView *)tableView viewModelArray:(NSArray *)viewModelArray {
    
    static NSString *ID = @"QQHomeAaCell";
    
    QQHomeAaCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQHomeAaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID viewModelArray:viewModelArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier viewModelArray:(NSArray *)viewModelArray {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUIWithViewModelArray:viewModelArray];
    }
    return self;
}

#pragma mark - SetupUI
- (void)setupUIWithViewModelArray:(NSArray *)viewModelArray {
    
    int colmns = 4;
    CGFloat itemW = [UIScreen mainScreen].bounds.size.width / colmns;
    CGFloat itemH = 0;
    itemH = kHomeAaCellMaxHeight / 2;
    
    QQHomeViewModel *viewModel = [[QQHomeViewModel alloc] init];
    
    for (int i = 0; i < viewModelArray.count; i++) {
        
        viewModel = viewModelArray[i];
        
        int row = i / colmns;
        int col = i % colmns;
        
        CGFloat itemX = itemW * col;
        CGFloat itemY = itemH * row;
        
        UIView *backGroundView = [[UIView alloc] init];
        backGroundView.frame = CGRectMake(itemX, itemY, itemW, itemH);
        [self addSubview:backGroundView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        backGroundView.tag = i;
        [backGroundView addGestureRecognizer:tap];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:viewModel.homeA.imgsrc] placeholderImage:[UIImage imageNamed:@"qq_news_placeholder"]];
        [backGroundView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(backGroundView);
            make.top.equalTo(backGroundView).offset(8);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = viewModel.homeA.title;
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:14];
        [backGroundView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imageView);
            make.top.equalTo(imageView.mas_bottom).offset(4);
        }];
    }
}

#pragma mark - Event Response
- (void)tap:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(tap:)]) {
        [self.delegate tap:tap];
    }
}

- (void)addSubview:(UIView *)view {
    if (![view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view)
        [super addSubview:view];
}

@end
