//
//  QQHomeMainListViewModel.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeMainListViewModel.h"
#import <MJExtension.h>
#import "QQChannel.h"

@implementation QQHomeMainListViewModel

- (void)loadChannalListCompletion:(void (^)(BOOL))completion {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"qq_news_channel.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//    NSLog(@"-=-=%@", dict[dict.keyEnumerator.nextObject]);
    self.homeMainList = [QQChannel mj_objectArrayWithKeyValuesArray:dict[dict.keyEnumerator.nextObject]];
    completion(self.homeMainList);
}

#pragma mark - Getters and Setters
- (NSMutableArray *)homeMainList {
    if (_homeMainList == nil) {
        _homeMainList = [NSMutableArray array];
    }
    return _homeMainList;
}

@end
