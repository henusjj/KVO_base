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
    if (self =[super init]) {
        _dog =[[Dog alloc]init];
    }
    return self;
}

//g监听dog的所有属性，就返回一个dog属性的集合，这样在监听对象的VC中，不必注册大量的注册代码

+(NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    NSSet *keyPath = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) {
        keyPath =[[NSSet alloc]initWithObjects:@"_dog.age",@"_dog.level", nil];
    }
    return keyPath;
}

//模式开关 -- 默认自动，Yes
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    
//    其余字段 key s判断是否需要自动监听改变值
    if ([key isEqualToString:@"name"]) {
        return YES;
    }
    
    return YES;
}
@end
