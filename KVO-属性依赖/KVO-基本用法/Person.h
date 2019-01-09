//
//  Person.h
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)Dog *dog;

@end

NS_ASSUME_NONNULL_END
