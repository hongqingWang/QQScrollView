//
//  QQRecommendViewModel.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQRecommendViewModel.h"
#import "QQRecommend.h"

@implementation QQRecommendViewModel

+ (instancetype)viewModelWithNews:(QQRecommend *)recommend {
    
    QQRecommendViewModel *viewModel = [[self alloc] init];
    
    viewModel.recommend = recommend;
    
    return viewModel;
}

- (NSURL *)imgsrc_url {
    
    return [NSURL URLWithString:self.recommend.imgsrc];
}

- (NSString *)replyCount_string {
    
    // 测试跟帖数超过1万
    //    self.news.replyCount = 23456;
    
    if (self.recommend.replyCount >= 10000) {
        
        NSString *string = [NSString stringWithFormat:@"%ld万 跟帖", self.recommend.replyCount / 10000];
        return string;
    }
    return [NSString stringWithFormat:@"%ld 跟帖", self.recommend.replyCount];
}

@end
