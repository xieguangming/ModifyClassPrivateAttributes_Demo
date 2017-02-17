//
//  Father.m
//  访问并修改类的私有属性_Demo
//
//  Created by xgm on 17/2/17.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import "Father.h"
#import "Child.h"


@interface Father()
@property (nonatomic, copy)NSString  *nicename;    // 私有属性

//使用KVC获取私有属性fatherName
@property (nonatomic,copy)NSString *fatherName;
@property (nonatomic,strong)Child *child;
@end
@implementation Father

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        self.fatherName = name;
        self.child = [[Child alloc] init];
        self.child.childName = @"小明";
    }
    return self;
}



-(NSString *)description{

    return [NSString stringWithFormat:@"name:%@",_nicename];

}

@end
