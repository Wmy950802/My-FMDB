//
//  WMYfmdbManager.m
//  3-15 FMDB封装
//
//  Created by 千锋 on 16/3/15.
//  Copyright © 2016年 WMY. All rights reserved.
//

#import "WMYfmdbManager.h"
#import "FMDatabase.h"
#import "WMYStudent.h"

@implementation WMYfmdbManager
{
    FMDatabase *_db;
}

- (instancetype)init
{
    if(self = [super init])
    {
        //在这儿创建数据库并且打开
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.db"];
        _db = [[FMDatabase alloc]initWithPath:path];
        
        BOOL result = [_db open];
        if(result)
        {
            NSLog(@"打开成功");
            [self creatTable];
        }
        else
        {
            NSLog(@"打开失败");
        }
    }
    return self;
}



+ (WMYfmdbManager *)defultFMDBManager
{
    static WMYfmdbManager *_manager;
    if(_manager == nil)
    {
        _manager = [[WMYfmdbManager alloc]init];
         
        
    }
    return _manager;
}


#pragma mark - 数据库操作

- (void)creatTable
{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS t_student(id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer DEFAULT 18,score real,address text,classname text);";
    
    BOOL ret = [_db executeUpdate:sql];
    if(ret)
    {
        NSLog(@"创建表成功");
    }
    else
    {
        NSLog(@"创建表失败");
    }
}
//前提是有一张表
- (void)insertStudent:(WMYStudent *)student
{
    NSString *sql = @"INSERT INTO t_student(name,age,address,classname,score) VALUES (?,?,?,?,?);";
    
    BOOL ret = [_db executeUpdate:sql,student.name,student.age,student.address,student.classname,student.score];
    if(ret)
    {
        NSLog(@"%@插入成功",student.name);
    }
    else
    {
        NSLog(@"%@插入失败",student.name);
    }
}

- (NSArray *)getAllstudentsInfoWithPageSize:(NSNumber *)pageSize startIdx:(NSNumber *)index
{
    NSString *sql = @"SELECT * FROM t_student LIMIT ?,?;";
    
    FMResultSet *set = [_db executeQuery:sql,pageSize,index];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    while ([set next]) {
        WMYStudent *stu = [[WMYStudent alloc]init];
        stu.name = [set objectForColumnName:@"name"];
        stu.age = [set objectForColumnName:@"age"];
        stu.classname = [set objectForColumnName:@"classname"];
        stu.address = [set objectForColumnName:@"address"];
        stu.score = [set objectForColumnName:@"score"];
        
        [array addObject:stu];
    }
    
    return array;
    
}





@end
