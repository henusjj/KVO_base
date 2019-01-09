//
//  NSObject+JK_KVO.m
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "NSObject+JK_KVO.h"
#import <objc/message.h>

@implementation NSObject (JK_KVO)

- (void)JK_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
//   1.创建一个类 -- self.class 就是Person
    NSString *oldname = NSStringFromClass(self.class);
    NSString *newNem = [@"JKKVO_" stringByAppendingString:oldname];
   Class myclass = objc_allocateClassPair(self.class, newNem.UTF8String, 0);
    // 注册类
    objc_registerClassPair(myclass);
        
//    2.重写子类set方法 -- 所谓的重写就是给子类添加f这个方法 setName,因为子类没有父类的setName方法！！！
    /* class ：给那个类添加方法
     *sel:方法编号
     *imp ：方法实现（函数指针）
     *type :返回值类型
     */
    class_addMethod(myclass, @selector(setName:), (IMP)setName, "v@:@");
    
//    3.修改isa指针
    object_setClass(self, myclass);
    
//    4.将观察保存到当前对象
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_ASSIGN);
    
}

void setName(id self,SEL _cmd,NSString *newName){
    NSLog(@"来了--%@",newName);
//    调用父类的setName方法
    Class class =[self class];
    object_setClass(self, class_getSuperclass(class));//改成父类
    
    objc_msgSend(self,@selector(setName:),newName);//发送消息给父类
    
    //    观察者
    id observer = objc_getAssociatedObject(self, @"observer");
    
    if (observer) {
        objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"new:":newName,@"kind:":@"1"},nil);
    }
    
//    改回子类
    object_setClass(self, class);
}
@end
