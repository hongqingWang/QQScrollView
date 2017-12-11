//
//  QQNewsViewModel.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsViewModel.h"
#import "QQNews.h"

static CGFloat const margin = 10;

@implementation QQNewsViewModel

+ (instancetype)viewModelWithNews:(QQNews *)news {
    
    QQNewsViewModel *viewModel = [[self alloc] init];
    
    viewModel.news = news;
    
    return viewModel;
}

#pragma mark - Getters and Setters
- (NSURL *)imgsrc_url {
    
    return [NSURL URLWithString:self.news.imgsrc];
}

- (NSMutableAttributedString *)title_attr_string {
    
    return [NSString qq_attributeString:self.news.title fontSize:14 lineSpacing:6];
}

- (NSString *)source_string {
    
    return self.news.source;
}

- (NSString *)daynum_string {
    
    return [NSString stringWithFormat:@"%ld", self.news.daynum];
}

- (CGFloat)cellHeight {
    
    if (_cellHeight) {
        return _cellHeight;
    }
    
    CGSize textMaxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - (2 * margin), MAXFLOAT);
    
    
    
    NSLog(@"%ld", self.news.replyCount);
    
    switch (self.news.replyCount % 3) {
        case 0:                                    // 没有图片
        {
            _cellHeight += 10;
            _cellHeight += [self.news.title boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size.height;
            _cellHeight += 10;
            _cellHeight += 15;
            _cellHeight += 10;
        }
            break;
        case 1:                                    // 一张图片
        {
            _cellHeight += 10;
            _cellHeight += 80;
            _cellHeight += 10;
        }
            break;
        case 2:                                    // 三张图片
        {
            _cellHeight += 10;
            _cellHeight += [self.news.title boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size.height;
            _cellHeight += 10;
            // 单张图片的高度
            _cellHeight += 60;
            _cellHeight += 10;
            _cellHeight += 15;
            _cellHeight += 10;
        }
            break;
            
        default:
            break;
    }
    
    return _cellHeight;
}

@end
