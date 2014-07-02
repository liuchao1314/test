//
//  ZzckService.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "TaskService.h"
#import "User.h"
#import "CreateTaskAction.h"
#import "TaskFlowAction.h"
#import "CurrentTaskFlow.h"
#import "CurrentTaskInfo.h"
#import "TaskFlowAction2.h"
static TaskService *taskService = nil;
@implementation TaskService

+ (TaskService *)taskService
{
    if (!taskService) {
        
        taskService = [[super allocWithZone:NULL] init];
    }
    return taskService;
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

-(ASIFormDataRequest*) request:(NSString*)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    return request;
}

-(void) createTaskWith:(NSString*)caseNo andTaskflowtype:(NSString*)flowtype caseType:(NSString*)caseType{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    User* user=[[UserInfo sharedUser] user];
    NSString* fields=[NSString stringWithFormat:@"CaseNo=%@^TaskType=vip^CarNum=%@^CarOwnerName=%@^CarOwnerPhone=%@^CaseType=%@",caseNo,user.carNum,user.relName,user.telephone,caseType];
   ASIFormDataRequest* request=[self request:@"http://58.248.185.165:85/WebService/service.asmx/CreateTask"];
    [request setPostValue:fields forKey:@"fields"];
    [request setPostValue:user.carNum forKey:@"username"];
    [request setPostValue:caseNo forKey:@"caseno"];
    [request setPostValue:flowtype forKey:@"taskflowtype"];
    [request setDelegate:[[CreateTaskAction alloc] init]];
    [request startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[AcModule sharedModule] foregroundViewController] view]  animated:YES];
    hud.labelText = @"案件创建中";
    
}

-(void) createTaskFlowWith:(NSNumber*)taskID taskflowtype:(NSString*)flowtype caseType:(NSString*)casetype{
    AcAction *action;
    if ([casetype isEqualToString:@"单方事故"]) {
        action=[[TaskFlowAction alloc] init];
    }else{
        action=[[TaskFlowAction2 alloc] init];
    }
    User* user=[[UserInfo sharedUser] user];
    NSString* fields=[NSString stringWithFormat:@"TaskID=%d^TaskFlowType=%@^Reporter=%@^ReportState=0^FrontOperator=0^FrontOperatorState=0^BackOperator=0^BackOperatorState=0",[taskID intValue],flowtype,user.relName];
    ASIFormDataRequest* request=[self request:@"http://58.248.185.165:85/WebService/service.asmx/CreateTaskFlow"];
    NSLog(@"taskID:%@--flowtype:%@--fields:%@",taskID,flowtype,fields);
    [request setPostValue:taskID forKey:@"taskid"];
    [request setPostValue:flowtype forKey:@"taskflowtype"];
    [request setPostValue:fields forKey:@"fields"];
    [request setDelegate:action];
    [request startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[AcModule sharedModule] foregroundViewController] view]  animated:YES];
    hud.labelText = @"案件流程创建中";
    
                                                                                                                                                                        
}

-(void)upload:(NSMutableDictionary*)step{
    NSNumber* taskID=[[[CurrentTaskInfo currentTaskInfo] taskInfo] taskID];
    TaskFlow* taskFlow=[[CurrentTaskFlow currentTaskFlow] taskFlow];
    NSNumber* taskFlowID=[taskFlow taskFlowID];
    NSString* TaskFlowType=[taskFlow taskFlowType];
    ASIFormDataRequest* request=[self request:@"http://58.248.185.165:85/WebService/upload.aspx?timespan=2010-1-1"];
    [request setPostValue:taskID forKey:@"TaskID"];
    [request setPostValue:taskFlowID forKey:@"TaskFlowID"];
    [request setPostValue:TaskFlowType forKey:@"TaskFlowType"];
    [request setPostValue:@"" forKey:@"file"];
    
}


@end
