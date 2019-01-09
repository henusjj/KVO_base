//
//  ViewController.m
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
@property(nonatomic,strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p=[[Person alloc]init];
    
    
/**kvo底层原理
     1. 创建了一个Person的子类 -----NSKVONotifying_Person

     2.重写了SetName的方法
 
     3.外界改变isa指针
     self->_p->isa:Person
     改变为
     self->_p->isa:
     NSKVONotifying_Person
 */
    
//    注册
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:nil];

}

//监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    自动模式
    static int a;
    _p.name = [NSString stringWithFormat:@"%d",a++];

}

@end
