//
//  ViewController.m
//  访问并修改类的私有属性_Demo
//
//  Created by xgm on 17/2/17.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "Child.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //***方法一:KVC键值编码
    Father *father1 = [[Father alloc]initWithName:@"老王"];
    
    // 访问私有属性的值
    Child *child = [father1 valueForKey:@"child"];
    NSString *fatherName = [father1 valueForKey:@"fatherName"];
    NSString *childName = [child valueForKey:@"childName"];
    NSLog(@"KVC-修改前fatherName:%@  childName:%@",fatherName,childName);
    
    
    //修改私有属性的值
    [father1 setValue:@"老李2223" forKey:@"fatherName"];
    [child setValue:@"小文" forKey:@"childName"];
    fatherName = [father1 valueForKey:@"fatherName"];
    childName = [child valueForKey:@"childName"];
    NSLog(@"KVC-修改后fatherName:%@  childName:%@",fatherName,childName);
    
    
    
    
    //***方法二:通过runtime
    Father *father = [Father new];
    //count纪录变量的数量,  IVar是runtime声明的一个宏
    unsigned int count = 0;
    //获取类的所有属性变量
    Ivar *menbers = class_copyIvarList([Father class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = menbers[i];
        //将Ivar变量转化为字符串，这里获取了属性名
        const char *memberName = ivar_getName(ivar);
        NSLog(@"%s",memberName);
        
        //修改属性值
        Ivar m_name = menbers[0];
        object_setIvar(father, m_name, @"zhang");
        // 打印后发现Father中name的值变为zhangsan
        NSLog(@"%@",[father description]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
