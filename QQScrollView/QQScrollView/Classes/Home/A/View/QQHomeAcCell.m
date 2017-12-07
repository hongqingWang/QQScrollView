//
//  QQHomeAcCell.m
//  QQScrollView
//
//  Created by Mac on 07/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeAcCell.h"

@implementation QQHomeAcCell

+ (instancetype)qq_homeAcCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQHomeAcCell";
    QQHomeAcCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQHomeAcCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    
}

@end
