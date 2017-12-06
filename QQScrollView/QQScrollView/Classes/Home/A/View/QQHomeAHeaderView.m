//
//  QQHomeAHeaderView.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAHeaderView.h"

static CGFloat headerViewHeight = 180;

@implementation QQHomeAHeaderView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, headerViewHeight);
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
