//
//  Task.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskFlow.h"
@interface TaskInfo : NSObject <NSCoding>
@property(strong)    NSNumber* taskID;
@property(strong)    NSString* caseNo;
@property(strong)    NSString* taskType;
@property(strong)    NSString* isRiskTask;
@property(strong)    NSString* riskType;
@property(strong)    NSString* carNum;
@property(strong)    NSString* carDriver;
@property(strong)    NSString* carOwnerName;
@property(strong)    NSString* carOwnerPhone;
@property(strong)    NSString* caseAddress;
@property(strong)    NSString* frontOperator;
@property(strong)    NSString* auditMount;
@property(strong)    NSString* latitude;
@property(strong)    NSString* longitude;
@property(strong)    NSString* caseType;
@property(strong)    NSString* blameRatio;
@property(strong)    NSDate* upLoadTime;
@property(strong)    NSDate* surveyTime;
@property(strong)    NSDate* reportTime;
@property(strong)    NSString* carType;
@property(strong)    NSString* garageType;
@property(strong)    NSString* garageName;
@property(strong)    NSMutableDictionary* taskFlowdic;
-(id) initWithDic:(NSDictionary*)dic;
@end
