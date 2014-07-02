//
//  ZzspFlow.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "ZzspFlow.h"

@implementation ZzspFlow



-(id) initWithDic:(NSDictionary *)dic{
    self.arr=[NSArray arrayWithObjects:@"拍摄银行帐号",@"拍摄发票证件",@"上传资料", nil];
    self=[super initWithDic:dic];
    if (self) {
        self.taskFlowType=@"Vip理赔";
        for (int i=0; i<[self maxStep]; i++) {
            NSString* defaultImageKey=[NSString stringWithFormat:@"task_compensate_much_step%d.jpg",i,nil];
            [self.flowList addObject:[NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:i],[self.arr objectAtIndex:i],defaultImageKey,[NSNumber numberWithBool:NO], nil] forKeys:[NSArray arrayWithObjects:@"stepNo",@"title",@"imageKey",@"isExist" ,nil]]];
        }
    }
    return self;
}
@end
