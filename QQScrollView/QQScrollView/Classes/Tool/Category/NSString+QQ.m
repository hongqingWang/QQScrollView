//
//  NSString+QQ.m
//  QQScrollView
//
//  Created by Mac on 08/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "NSString+QQ.h"

@implementation NSString (QQ)

+ (NSMutableAttributedString *)qq_attributeString:(NSString *)string fontSize:(CGFloat)fontSize lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    // 解决`Label`不能正确换行问题
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSParagraphStyleAttributeName] = paragraphStyle;
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
    [attributedString addAttributes:attrs range:NSMakeRange(0, [string length])];
    return attributedString;
}

@end
