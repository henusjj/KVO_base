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
//    注册 -- 没有强引入 p 对 self
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(dog)) options:NSKeyValueObservingOptionNew context:nil];
}

//监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@---dog.age:%d-\n-dog.level:%d",change,_p.dog.age,_p.dog.level);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    自动模式
    static int a;
    _p.dog.age = a++;
    _p.dog.level = a++;

}

-(void)dealloc{
    [_p removeObserver:self forKeyPath:@"dog"];
}
@end
