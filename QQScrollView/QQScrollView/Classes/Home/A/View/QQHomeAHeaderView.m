//
//  QQHomeAHeaderView.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAHeaderView.h"
#import <SDCycleScrollView.h>
//#import "QQHomeAController.h"

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
    
    [self addSubview:self.cycleScrollView];
}

#pragma mark - Getters and Setters
- (SDCycleScrollView *)cycleScrollView {
    if (_cycleScrollView == nil) {
        NSArray *array = @[
                           @"qq_cycle_test",
                           //                       @"qq_cycle_placeholder",
                           ];
        CGRect frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame imageNamesGroup:array];
        _cycleScrollView.backgroundColor = [UIColor whiteColor];
    }
    return _cycleScrollView;
}

@end
