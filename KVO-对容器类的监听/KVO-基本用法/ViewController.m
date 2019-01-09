//
//  ViewController.m
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//  RAC---函数式响应式编程框架



#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
@property(nonatomic,strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p=[[Person alloc]init];
//    注册
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(arry)) options:NSKeyValueObservingOptionNew context:nil];

}

//监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@-----\n--%@",change,_p.arry);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    自动模式
    static int a;
    
//    [_p.arry addObject:[NSString stringWithFormat:@"%d",a++]];//这一步不会触发监听方法因为监听是监听set的方法，addObject不是set方法
    
    //解决方法
    NSMutableArray *tenp =[_p mutableArrayValueForKey:@"arry"];
    [tenp addObject:[NSString stringWithFormat:@"%d",a++]];
    
    
}

-(void)dealloc{
    [_p removeObserver:self forKeyPath:@"arry"];
}
@end
