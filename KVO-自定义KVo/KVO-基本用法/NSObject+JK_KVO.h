//
//  NSObject+JK_KVO.h
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JK_KVO)
- (void)JK_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end

NS_ASSUME_NONNULL_END
