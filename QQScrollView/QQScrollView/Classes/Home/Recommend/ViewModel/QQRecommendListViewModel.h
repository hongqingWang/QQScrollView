//
//  QQRecommendListViewModel.h
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QQRecommendViewModel;

@interface QQRecommendListViewModel : NSObject

/// 推荐新闻模型数组
@property (nonatomic, strong) NSMutableArray *newsList;

- (void)loadNewsDataCompletion:(void (^)(BOOL isSuccessed))completion;

@end
