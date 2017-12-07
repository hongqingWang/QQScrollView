//
//  QQHomeListViewModel.h
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQHomeListViewModel : NSObject

/// ItemList
@property (nonatomic, strong) NSMutableArray *itemList;

/**
 加载`ItemList`
 
 @param completion completion
 */
- (void)loadItemListCompletion:(void (^)(BOOL isSuccessed))completion;

@end
