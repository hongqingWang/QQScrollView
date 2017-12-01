//
//  QQRecommendCell.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQRecommendCell.h"

@implementation QQRecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUI];
    }
    return self;
}

+ (instancetype)recommendCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQRecommendCell";
    QQRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    
}

@end
