//
//  BaseTableViewCell.m
//  CarControl
//
//  Created by bqt on 2017/7/31.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (BaseTableViewCell *)loadTableViewCellWithNibInTableView:(UITableView *)tableView
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    }
    
    
    return cell;
}

+ (BaseTableViewCell *)loadTableViewCellWithNibInTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
