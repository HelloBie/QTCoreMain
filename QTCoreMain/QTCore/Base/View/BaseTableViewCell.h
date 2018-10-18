//
//  BaseTableViewCell.h
//  CarControl
//
//  Created by bqt on 2017/7/31.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
+ (BaseTableViewCell *)loadTableViewCellWithNibInTableView:(UITableView *)tableView;
+ (BaseTableViewCell *)loadTableViewCellWithNibInTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;
@end
