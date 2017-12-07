//
//  QQAViewModel.h
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QQHomeA;

@interface QQAViewModel : NSObject

/// 模型
@property (nonatomic, strong) QQHomeA *homeA;

+ (instancetype)viewModelWithHomeA:(QQHomeA *)homeA;

@end
