//
//  CreateTaskAction.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "CreateTaskAction.h"
#import "TaskInfo.h"
#import "ZzckStore.h"
#import "ZzspStore.h"
@implementation CreateTaskAction

-(void) sucess:(id)obj{
    [super sucess:obj];
    NSDictionary *taskDictionary=[[[obj objectForKey:@"msg"] JSONValue] objectAtIndex:0];
    TaskInfo* task=[[TaskInfo alloc] initWithDic:taskDictionary];
    
    NSLog(@"%@",task.taskID);
    
    if ([[[AcModule sharedModule] currentModule] isEqualToString:@"zzck"]) {
      
        [[ZzckStore zzckStore] addTask:task];

    }else if([[[AcModule sharedModule] currentModule] isEqualToString:@"zzsp"]){
     
        [[ZzspStore zzspStore] addTask:task];
        NSLog(@"~~~~~~%d",[[[ZzckStore zzckStore] flowList] count]);
    }
    
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:@"创建成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UINavigationController* nav=[[[AcModule sharedModule] foregroundViewController] navigationController];
    [nav popViewControllerAnimated:YES];
}

@end
