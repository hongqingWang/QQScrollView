//
//  QQNetworkManager+Home.h
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNetworkManager.h"

@interface QQNetworkManager (Home)

- (void)loadNewsDataCompletion:(void (^)(NSArray *dataArray))completion;

@end
