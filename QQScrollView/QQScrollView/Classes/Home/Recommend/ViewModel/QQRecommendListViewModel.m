//
//  QQRecommendListViewModel.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQRecommendListViewModel.h"
#import "QQNetworkManager+News.h"
#import "QQRecommend.h"
#import <MJExtension.h>
#import "QQRecommendViewModel.h"

@implementation QQRecommendListViewModel

- (void)loadNewsDataCompletion:(void (^)(BOOL))completion {
    
    [[QQNetworkManager sharedManager] loadNewsDataCompletion:^(NSArray *dataArray) {
        
        NSLog(@"%s %@", __FUNCTION__, dataArray);
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dataArray.count];
        
        for (NSDictionary *dict in dataArray) {
            
            QQRecommend *recommend = [QQRecommend mj_objectWithKeyValues:dict];
            [arrayM addObject:[QQRecommendViewModel viewModelWithNews:recommend]];
        }
        
        [self.newsList addObjectsFromArray:arrayM];
        
        // 将结果回调给`QQNewsViewController`,使其进行刷新界面等操作
        completion(YES);
    }];
}

#pragma mark - Getters and Setters
- (NSMutableArray *)newsList {
    if (_newsList == nil) {
        _newsList = [[NSMutableArray alloc] init];
    }
    return _newsList;
}

@end
