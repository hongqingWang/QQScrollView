//
//  QQHomeTableView.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeTableView.h"

@implementation QQHomeTableView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 30 - 49);
        self = [[QQHomeTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    }
    return self;
}

@end
