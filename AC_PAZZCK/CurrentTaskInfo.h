//
//  CurrentTaskInfo.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskInfo.h"
@interface CurrentTaskInfo : NSObject
{
    TaskInfo* taskInfo;
}
@property (strong) TaskInfo* taskInfo;
+(CurrentTaskInfo*) currentTaskInfo;
@end
