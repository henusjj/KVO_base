//
//  Person.h
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *arry;
@end

NS_ASSUME_NONNULL_END
