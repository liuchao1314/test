//
//  CurrentTaskInfo.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "CurrentTaskInfo.h"
static CurrentTaskInfo* currentTaskInfo=nil;
@implementation CurrentTaskInfo
@synthesize taskInfo;
+(CurrentTaskInfo*) currentTaskInfo{
    if (!currentTaskInfo) {
        currentTaskInfo=[[super allocWithZone:nil] init];
    }
    return currentTaskInfo;
}

+(id) allocWithZone:(NSZone *)zone{
    return [self currentTaskInfo];
}

-(id) init{
    if (currentTaskInfo) {
        return currentTaskInfo;
    }
    
    self=[super init];
    if (self) {
        
        self.taskInfo=nil;
        
    }
    
    return self;
}


- (id)retain
{
    
    return self;
}

- (void)release
{
    
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

@end