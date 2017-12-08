//
//  QQRecommendViewModel.h
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QQNews;

@interface QQRecommendViewModel : NSObject

/// 新闻数据模型
@property (nonatomic, strong) QQNews *news;
/// 新闻图片URL
@property (nonatomic, strong) NSURL *imgsrc_url;
/// 跟帖数(在此处理)
@property (nonatomic, copy) NSString *replyCount_string;

+ (instancetype)viewModelWithNews:(QQNews *)news;

@end
