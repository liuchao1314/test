//
//  ZzspStore.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskInfo.h"
@interface ZzspStore : NSObject
{
    NSMutableArray* flowList;
}
@property (strong,nonatomic) NSMutableArray* flowList;
+(ZzspStore*) zzspStore;
-(void) addTask:(TaskInfo*)task;
-(NSString *) archivePath;
- (BOOL)saveChanges;
-(void)fetchFlowListIfNecessary;
-(id) getTaskByID:(int)taskID;
@end
