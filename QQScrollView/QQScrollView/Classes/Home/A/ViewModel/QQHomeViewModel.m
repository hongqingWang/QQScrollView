//
//  QQHomeViewModel.m
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeViewModel.h"

@implementation QQHomeViewModel

+ (instancetype)viewModelWithHomeA:(QQHomeA *)homeA {
    
    QQHomeViewModel *viewModel = [[self alloc] init];
    viewModel.homeA = homeA;
    return viewModel;
}

@end
