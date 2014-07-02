//
//  CurrentZzckTaskFlow.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskFlow.h"
@interface CurrentTaskFlow : NSObject
{
    TaskFlow* taskFlow;
}
@property (strong) TaskFlow* taskFlow;
+(CurrentTaskFlow*) currentTaskFlow;
@end
