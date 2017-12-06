//
//  QQHomeAHeaderView.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAHeaderView.h"
#import <SDCycleScrollView.h>

static CGFloat headerViewHeight = 180;

@implementation QQHomeAHeaderView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, headerViewHeight);
        self.backgroundColor = [UIColor redColor];
        [self setupUI];
    }
    return self;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    NSArray *array = @[
                       @"qq_cycle_placeholder",
                       @"qq_cycle_test"
                       ];
    CGRect frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame imageNamesGroup:array];
    [self addSubview:cycleScrollView];
}

@end
