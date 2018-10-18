//
//  BaseModel.h
//  Decoration
//
//  Created by bqt on 16/11/4.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property(nonatomic, strong)NSString *rownum_;
- (NSDictionary *)dictionaryFromModel;

/**
 *  带model的数组或字典转字典
 *
 *  @param object 带model的数组或字典转
 *
 *  @return 字典
 */
- (id)idFromObject:(nonnull id)object;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
