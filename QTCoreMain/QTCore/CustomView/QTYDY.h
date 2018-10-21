//
//  QTYDY.h
//  YDY
//
//  Created by MasterBie on 2018/10/21.
//  Copyright © 2018年 MasterBie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTYDY : UIView
// appdelegate里调用 传图片名字数组,自带版本号判断,侧滑移除,适用于不带按钮的引导页
+ (void)addToWindowWithImageNames:(NSArray *)imageNames;
@end

NS_ASSUME_NONNULL_END
