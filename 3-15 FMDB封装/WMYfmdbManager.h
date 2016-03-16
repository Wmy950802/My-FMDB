//
//  WMYfmdbManager.h
//  3-15 FMDB封装
//
//  Created by 千锋 on 16/3/15.
//  Copyright © 2016年 WMY. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase;
@class WMYStudent;

@interface WMYfmdbManager : NSObject

//保证Manager在整个工程中是唯一，对应一个数据库
+ (WMYfmdbManager *)defultFMDBManager;

- (void)insertStudent:(WMYStudent *)student;

- (void)deleteStudentWithName:(NSString *)name;

- (void)deleteAllStudent;

- (void)updateScoreWithStudentName:(NSString *)name;

//获取指定班的所有学生信息
- (NSArray *)getAllStudentsWithClass:(NSString *)classname;

//获取指定学生的信息
- (WMYStudent *)getStudentInfoWithName:(NSString *)name;

- (NSArray *)getAllstudentsInfoWithPageSize:(NSNumber *)pageSize startIdx:(NSNumber *)index;












@end
