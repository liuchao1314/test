//
//  ZzckService.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface TaskService : NSObject
+(TaskService*) taskService;
-(void) createTaskWith:(NSString*)caseNo andTaskflowtype:(NSString*)flowtype caseType:(NSString*)caseType ;
-(void) createTaskFlowWith:(NSNumber*)taskID taskflowtype:(NSString*)flowtype caseType:(NSString*)casetype;

-(void)upload:(NSMutableDictionary*)step;

@end
