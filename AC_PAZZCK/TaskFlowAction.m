//
//  TaskFlowAction.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "TaskFlowAction.h"
#import "TaskFlow.h"
#import "ZzckFlow.h"
#import "CurrentTaskFlow.h"
#import "CurrentTaskInfo.h"
#import "ZzckStore.h"
#import "ZzspFlow.h"
@implementation TaskFlowAction

-(void) sucess:(id)obj{
    
    NSDictionary *taskDictionary=[[obj objectForKey:@"msg"] JSONValue];
    TaskFlow* taskFlow;
    if (  [[[AcModule sharedModule] currentModule] isEqualToString:@"zzck"] ) {
         taskFlow=[[ZzckFlow alloc] initWithDic:taskDictionary];
    }else if([[[AcModule sharedModule] currentModule] isEqualToString:@"zzsp"]){
        taskFlow=[[ZzspFlow alloc] initWithDic:taskDictionary];
    }
    
    
    [[[[CurrentTaskInfo currentTaskInfo] taskInfo] taskFlowdic] setObject:taskFlow forKey:[[AcModule sharedModule] currentModule]];
    [[CurrentTaskFlow currentTaskFlow] setTaskFlow:taskFlow];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:@"创建成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    
   }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [[[AcModule sharedModule] foregroundViewController] redirectModule:@"flow"];
}

@end
