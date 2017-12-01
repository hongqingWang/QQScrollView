//
//  QQNetworkManager+Home.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNetworkManager+Home.h"

static NSString *const newsURLString = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html";

@implementation QQNetworkManager (Home)

- (void)loadNewsDataCompletion:(void (^)(NSArray *))completion {
    
    [[QQNetworkManager sharedManager] qq_request:GET urlString:newsURLString parameters:nil finished:^(id result, NSError *error) {
        if (error) {
            NSLog(@"%s %@", __FUNCTION__, error);
        }
        NSLog(@"%s %@", __FUNCTION__, result);
        
        /**
         * 简单处理数据,只把需要的回调到`QQNewsListViewModel`中
         */
        completion(result[@"T1348647853363"]);
    }];
}

@end
