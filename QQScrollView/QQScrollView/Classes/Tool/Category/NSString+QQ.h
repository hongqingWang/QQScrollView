//
//  NSString+QQ.h
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QQ)

/**
 富文本(行间距)

 @param string string
 @param fontSize fontSize
 @param lineSpacing lineSpacing
 @return return
 */
+ (NSMutableAttributedString *)qq_attributeString:(NSString *)string fontSize:(CGFloat)fontSize lineSpacing:(CGFloat)lineSpacing;

@end
