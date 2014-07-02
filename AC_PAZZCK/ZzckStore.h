//
//  ZzckStore.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskInfo.h"
@interface ZzckStore : NSObject
{
    NSMutableArray* flowList;
}
@property (strong,nonatomic) NSMutableArray* flowList;
+(ZzckStore*) zzckStore;
-(void) addTask:(TaskInfo*)task;
-(NSString *) archivePath;
- (BOOL)saveChanges;
-(void)fetchFlowListIfNecessary;
-(id) getTaskByID:(int)taskID;
@end
