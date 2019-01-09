//
//  ViewController.m
//  KVO-基本用法
//
//  Created by GuoYanjun on 2019/1/9.
//  Copyright © 2019年 shiyujin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import "NSObject+JK_KVO.h"
@interface ViewController ()
@property(nonatomic,strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p=[[Person alloc]init];
    
//    注册
    //打断点，查看p的isa类型
    [_p JK_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];

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
