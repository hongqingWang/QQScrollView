//
//  QQNewsViewModel.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsViewModel.h"
#import "QQNews.h"

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

@end
