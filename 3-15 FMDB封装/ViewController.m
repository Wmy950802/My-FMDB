//
//  ViewController.m
//  3-15 FMDB封装
//
//  Created by 千锋 on 16/3/15.
//  Copyright © 2016年 WMY. All rights reserved.
//

#import "ViewController.h"
#import "WMYfmdbManager.h"
#import "WMYStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSHomeDirectory());
    
    for(int i = 0;i < 20;i++)
    {
        WMYStudent *stu = [[WMYStudent alloc]init];
        stu.name = @"小明";
        stu.age = @22;
        stu.classname = @"ios1508";
        [[WMYfmdbManager defultFMDBManager] insertStudent:stu];
    }
    
    NSArray *array = [[WMYfmdbManager defultFMDBManager]getAllstudentsInfoWithPageSize:@0 startIdx:@5];
    for(WMYStudent *stu in array)
    {
        [stu show];
    }
    
}








@end
