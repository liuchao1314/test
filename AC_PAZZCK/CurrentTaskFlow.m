//
//  CurrentZzckTaskFlow.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "CurrentTaskFlow.h"
static CurrentTaskFlow* currentTaskFlow=nil;
@implementation CurrentTaskFlow
@synthesize taskFlow;    
+(CurrentTaskFlow*) currentTaskFlow{
    if (!currentTaskFlow) {
        currentTaskFlow=[[super allocWithZone:nil] init];
    }
    return currentTaskFlow;
}

+(id) allocWithZone:(NSZone *)zone{
    return [self currentTaskFlow];
}

-(id) init{
    if (currentTaskFlow) {
        return currentTaskFlow;
    }
    
    self=[super init];
    if (self) {
        
        self.taskFlow=nil;
        
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
