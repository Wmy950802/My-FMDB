//
//  WMYStudent.h
//  3-15 FMDB封装
//
//  Created by 千锋 on 16/3/15.
//  Copyright © 2016年 WMY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMYStudent : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *classname;

@property (nonatomic,copy) NSString *address;

@property (nonatomic,assign) NSNumber * age;

@property (nonatomic,assign) NSNumber * score;

- (void)show;


@end
