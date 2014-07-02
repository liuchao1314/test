//
//  TaskFlow.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "TaskFlow.h"
#import "User.h"
@implementation TaskFlow
@synthesize taskFlowID,taskFlowType,reporter,reportState,frontOperator,frontOperatorState,backOperator,backOperatorState,flowList,currentStep,isComplete,stepCount,arr;
-(int) maxStep{
    return arr.count;
}

-(id)initWithDic:(NSDictionary*)dic{
    self=[super init];
    for (NSString* s in dic) {
        NSLog(@"--key:%@  --value:%@",s,[dic objectForKey:s]);
    }
    self.taskFlowID=[dic objectForKey:@"TaskFlowID"];
    self.reporter=[[[UserInfo sharedUser] user] relName];
    self.reportState=@"0";
    self.frontOperator=@"0";
    self.frontOperatorState=@"0";
    self.backOperator=@"0";
    self.backOperatorState=@"0";
    self.flowList=[[NSMutableArray alloc] init];
     
    self.isComplete=NO;
    self.currentStep=nil;
    self.stepCount=0;
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self) {
        [self setTaskFlowID:[decoder decodeObjectForKey:@"taskFlowID"]];
        [self setTaskFlowType:[decoder decodeObjectForKey:@"taskFlowType"]];
        [self setReporter:[decoder decodeObjectForKey:@"reporter"]];
        [self setReportState:[decoder decodeObjectForKey:@"reportState"]];
        [self setFrontOperator:[decoder decodeObjectForKey:@"frontOperator"]];
        [self setFrontOperatorState:[decoder decodeObjectForKey:@"frontOperatorState"]];
        [self setBackOperator:[decoder decodeObjectForKey:@"backOperator"]];
        [self setBackOperatorState:[decoder decodeObjectForKey:@"backOperatorState"]];
        [self setFlowList:[decoder decodeObjectForKey:@"flowList"]];
        [self setIsComplete:[decoder decodeBoolForKey:@"isComplete"]];
        [self setCurrentStep:[decoder decodeObjectForKey:@"currentStep"]];
        [self setStepCount:[decoder decodeInt32ForKey:@"stepCount"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:taskFlowID forKey:@"taskFlowID"];
    [encoder encodeObject:taskFlowType forKey:@"taskFlowType"];
    [encoder encodeObject:reporter forKey:@"reporter"];
    [encoder encodeObject:reportState forKey:@"reportState"];
    [encoder encodeObject:frontOperator forKey:@"frontOperator"];
    [encoder encodeObject:frontOperatorState forKey:@"frontOperatorState"];
    [encoder encodeObject:backOperator forKey:@"backOperator"];
    [encoder encodeObject:backOperatorState forKey:@"backOperatorState"];
    [encoder encodeObject:flowList forKey:@"flowList"];
    [encoder encodeBool:self.isComplete forKey:@"isComplete"];
    [encoder encodeObject:self.currentStep forKey:@"currentStep"];
    [encoder encodeInt32:self.stepCount forKey:@"stepCount"];
}
@end
