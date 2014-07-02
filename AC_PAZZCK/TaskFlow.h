//
//  TaskFlow.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskFlow : NSObject <NSCoding>
@property (strong) NSNumber* taskFlowID;
@property (strong) NSString* taskFlowType;
@property (strong) NSString* reporter;
@property (strong) NSString* reportState;
@property (strong) NSString* frontOperator;
@property (strong) NSString* frontOperatorState;
@property (strong) NSString* backOperator;
@property (strong) NSString* backOperatorState;
@property (strong) NSMutableArray* flowList;
@property  BOOL isComplete;
@property (assign) NSDictionary* currentStep;
@property int stepCount;
-(id) initWithDic:(NSDictionary*)dic;
-(int) maxStep;
@property (strong) NSArray* arr;
@end
