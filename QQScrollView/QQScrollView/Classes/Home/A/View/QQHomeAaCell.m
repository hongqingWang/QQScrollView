//
//  QQHomeAaCell.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAaCell.h"

static CGFloat const kHomeAaCellMaxHeight = 200;

@interface QQHomeAaCell ()

@end

@implementation QQHomeAaCell

+ (instancetype)qq_homeAaCellWithTableView:(UITableView *)tableView itemCount:(NSInteger)itemCount {
    
    static NSString *ID = @"QQHomeAaCell";
    
    QQHomeAaCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQHomeAaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID itemCount:itemCount];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier itemCount:(NSInteger)itemCount {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUIWithItemCount:itemCount];
    }
    return self;
}

#pragma mark - SetupUI
- (void)setupUIWithItemCount:(NSInteger)itemCount {
    
    int colmns = 4;
    CGFloat itemW = [UIScreen mainScreen].bounds.size.width / colmns;
    CGFloat itemH = 0;
    itemH = kHomeAaCellMaxHeight / 2;
    
    for (int i = 0; i < itemCount; i++) {
        
        int row = i / colmns;
        int col = i % colmns;
        
        CGFloat itemX = itemW * col;
        CGFloat itemY = itemH * row;
        
        UIView *backGroundView = [[UIView alloc] init];
        backGroundView.frame = CGRectMake(itemX, itemY, itemW, itemH);
        backGroundView.backgroundColor = [UIColor qq_randomColor];
        [self addSubview:backGroundView];
    }
}

@end
