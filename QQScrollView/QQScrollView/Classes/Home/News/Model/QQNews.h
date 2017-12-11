//
//  QQNews.h
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQNews : NSObject

/// 新闻图片地址
@property (nonatomic, copy) NSString *imgsrc;
/// 新闻主标题
@property (nonatomic, copy) NSString *title;
/// 来源
@property (nonatomic, copy) NSString *source;
/// 跟帖数
@property (nonatomic, assign) NSInteger daynum;
/// replyCount
@property (nonatomic, assign) NSInteger replyCount;

@end
