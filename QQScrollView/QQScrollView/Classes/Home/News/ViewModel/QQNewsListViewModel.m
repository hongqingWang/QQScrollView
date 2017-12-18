//
//  QQNewsListViewModel.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsListViewModel.h"
#import "QQNetworkManager+News.h"
#import "QQNews.h"
#import "QQNewsViewModel.h"

#import "QQNewsModel.h"

@implementation QQNewsListViewModel

- (void)loadNewsDataCompletion:(void (^)(BOOL))completion {
    
    [[QQNetworkManager sharedManager] loadNewsDataCompletion:^(NSArray *dataArray) {
        
        NSLog(@"%s %@", __FUNCTION__, dataArray);
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dataArray.count];
        
        for (NSDictionary *dict in dataArray) {
            
            QQNews *news = [QQNews mj_objectWithKeyValues:dict];
            [arrayM addObject:[QQNewsViewModel viewModelWithNews:news]];
            NSLog(@"%@", news.title);
            QQNewsModel *model = [MTLJSONAdapter modelOfClass:[QQNewsModel class] fromJSONDictionary:dict error:nil];
            NSLog(@"-=-=%@", model.title);
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
