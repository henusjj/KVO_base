//
//  Person.m
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "Person.h"

@implementation Person
//模式开关 -- 默认自动，Yes
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    
//    其余字段 key s判断是否需要自动监听改变值
    if ([key isEqualToString:@"name"]) {
        return YES;
    }
    
    return NO;
}
@end
