//
//  QQAViewModel.m
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQAViewModel.h"

@implementation QQAViewModel

+ (instancetype)viewModelWithHomeA:(QQHomeA *)homeA {
    
    QQAViewModel *viewModel = [[self alloc] init];
    viewModel.homeA = homeA;
    return viewModel;
}

@end
