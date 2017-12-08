//
//  UILabel+QQ.h
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QQ)

/**
 Label 的富文本(行间距)

 @param text text
 @param lineSpacing lineSpacing
 */
- (void)qq_setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;

@end
