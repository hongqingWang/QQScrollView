//
//  QQNewsOneImageCell.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsOneImageCell.h"

@implementation QQNewsOneImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUI];
    }
    return self;
}

+ (instancetype)qq_newsOneImageCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQNewsOneImageCell";
    QQNewsOneImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQNewsOneImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    
}

@end
