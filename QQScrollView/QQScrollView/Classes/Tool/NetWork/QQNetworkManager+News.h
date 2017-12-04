//
//  QQNetworkManager+News.h
//  QQScrollView
//
//  Created by Mac on 04/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNetworkManager.h"

@interface QQNetworkManager (News)

- (void)loadNewsDataCompletion:(void (^)(NSArray *dataArray))completion;

@end
