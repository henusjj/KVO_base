//
//  Person.m
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "Person.h"

@implementation Person
-(instancetype)init{
    if (self = [super init]) {
        _arry = [[NSMutableArray alloc]init];
    }
    return self;
}
@end
