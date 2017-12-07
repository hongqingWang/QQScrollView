//
//  QQHomeListViewModel.m
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeListViewModel.h"
#import "QQHomeA.h"
#import "QQHomeViewModel.h"

@implementation QQHomeListViewModel

- (void)loadItemListCompletion:(void (^)(BOOL))completion {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"qq_item_list.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//    NSLog(@"%s %@", __FUNCTION__, dictArray);
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dictArray.count];
    
    for (NSDictionary *dict in dictArray) {
        QQHomeA *homeA = [QQHomeA mj_objectWithKeyValues:dict];
        [arrayM addObject:[QQHomeViewModel viewModelWithHomeA:homeA]];
    }
    
    [self.itemList addObjectsFromArray:arrayM];
    completion(YES);
}

#pragma mark - Getters and Setters
- (NSMutableArray *)itemList {
    if (_itemList == nil) {
        _itemList = [NSMutableArray array];
    }
    return _itemList;
}

@end
