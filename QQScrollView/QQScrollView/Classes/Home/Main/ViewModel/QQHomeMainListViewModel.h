//
//  QQHomeMainListViewModel.h
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQHomeMainListViewModel : NSObject

/// 频道列表
@property (nonatomic, strong) NSMutableArray *homeMainList;

- (void)loadChannalListCompletion:(void (^)(BOOL isSuccessed))completion;

@end
