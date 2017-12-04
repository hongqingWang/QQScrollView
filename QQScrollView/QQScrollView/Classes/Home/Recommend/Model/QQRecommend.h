//
//  QQRecommend.h
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQRecommend : NSObject

/// 新闻图片地址
@property (nonatomic, copy) NSString *imgsrc;
/// 新闻主标题
@property (nonatomic, copy) NSString *title;
/// 新闻摘要
@property (nonatomic, copy) NSString *digest;
/// 跟帖数
@property (nonatomic, assign) NSInteger replyCount;

@end
