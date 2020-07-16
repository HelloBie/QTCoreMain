//
//  UIButton+AutoFontSize.m
//  Decoration
//
//  Created by bqt on 16/10/21.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import "UIButton+AutoFontSize.h"
#import <objc/runtime.h>

#define AutoFontSizeOffWidth [UIScreen mainScreen].bounds.size.width / 375
#define AutoFontSizeOffHeight [UIScreen mainScreen].bounds.size.height / 667

@implementation UIButton (AutoFontSize)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.titleLabel.tag != 333){
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [self.titleLabel.font fontWithSize:fontSize * AutoFontSizeOffWidth - 1 ];
        }
    }
    return self;
}

@end


@implementation UILabel (AutoFontSize)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        NSLog(@"%@", self.font);
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [self.font fontWithSize:fontSize * AutoFontSizeOffWidth - 1];
        }
    }
    return self;
}

@end

@implementation UITextField (AutoFontSize)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [self.font fontWithSize:fontSize * AutoFontSizeOffWidth - 1];
        }
    }
    return self;
}

@end

@implementation UITextView (AutoFontSize)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [self.font fontWithSize:fontSize * AutoFontSizeOffWidth - 1];
        }
    }
    return self;
}

@end
