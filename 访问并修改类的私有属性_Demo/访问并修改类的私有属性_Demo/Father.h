//
//  Father.h
//  访问并修改类的私有属性_Demo
//
//  Created by xgm on 17/2/17.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Father : NSObject

//使用KVC访问
-(instancetype)initWithName:(NSString *)name;
@end
