//
//  QQNewsModel.m
//  QQScrollView
//
//  Created by Mac on 18/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsModel.h"

@implementation QQNewsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"imgsrc":@"imgsrc",
             @"title":@"title"
             };
}

@end
