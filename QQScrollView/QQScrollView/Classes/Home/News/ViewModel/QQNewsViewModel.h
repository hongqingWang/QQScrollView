//
//  QQNewsViewModel.h
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QQNews;

@interface QQNewsViewModel : NSObject

/// 新闻数据模型
@property (nonatomic, strong) QQNews *news;
/// 新闻图片URL
@property (nonatomic, strong) NSURL *imgsrc_url;
/// 标题
@property (nonatomic, copy) NSMutableAttributedString *title_attr_string;
/// 来源
@property (nonatomic, copy) NSString *source_string;
/// 浏览量
@property (nonatomic, copy) NSString *daynum_string;

+ (instancetype)viewModelWithNews:(QQNews *)news;

@end
