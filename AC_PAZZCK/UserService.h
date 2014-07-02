//
//  UserService.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginAction.h"
#import "RegisterAction.h"
@interface UserService : NSObject
+ (UserService *)userService;
-(void) registerWith:(NSString*)carNum passWord:(NSString*)pwd realName:(NSString*)rName telephone:(NSString*)tel policyNum:(NSString*)pN;
-(void) loginWithCarNum:(NSString*)username andPassword:(NSString*)pwd;
@end
