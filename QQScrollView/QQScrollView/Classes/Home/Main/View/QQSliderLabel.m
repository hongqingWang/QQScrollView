//
//  QQSliderLabel.m
//  QQScrollView
//
//  Created by Mac on 04/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQSliderLabel.h"

@implementation QQSliderLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:18];
        self.userInteractionEnabled = YES;
        self.scale = 0.0;
    }
    return self;
}

- (void)setScale:(CGFloat)scale {
    _scale = scale;
    
    // 颜色渐变
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1.0];
    
    // 大小渐变
    CGFloat minWHScale = 0.8;
    CGFloat whScale = minWHScale + scale * (1 - minWHScale);
    self.transform = CGAffineTransformMakeScale(whScale, whScale);
}

@end
