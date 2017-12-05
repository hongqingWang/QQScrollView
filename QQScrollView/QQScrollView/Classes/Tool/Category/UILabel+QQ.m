//
//  UILabel+QQ.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "UILabel+QQ.h"

@implementation UILabel (QQ)

- (void)qq_setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSParagraphStyleAttributeName] = paragraphStyle;
    
    [attributedString addAttributes:attrs range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

@end
