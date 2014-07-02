//
//  ZzckFlow.m
//  TaskFlow
//
//  Created by 陈 玉龙 on 12-8-20.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "ZzckFlow.h"
@implementation ZzckFlow


-(id) initWithDic:(NSDictionary *)dic{
    self.arr=[NSArray arrayWithObjects:@"拍摄标的车架号码",@"事故现场全景",
         @"标的车全貌",
         @"标的车45度",
         @"标的车车损",
         @"我也不知道",
         @"上传资料", nil];
   self=[super initWithDic:dic];
    if (self) {
        self.taskFlowType=@"VIP查勘";
        for (int i=0; i<[self maxStep]; i++) {
             NSString* defaultImageKey=[NSString stringWithFormat:@"task_survey_much_step%d.jpg",i,nil];
             [self.flowList addObject:[NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:i],[self.arr objectAtIndex:i],defaultImageKey,[NSNumber numberWithBool:NO], nil] forKeys:[NSArray arrayWithObjects:@"stepNo",@"title",@"imageKey",@"isExist" ,nil]]];
            }
    }
    return self;
}

@end
