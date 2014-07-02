//
//  UserService.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "UserService.h"

static UserService *userService = nil;

@implementation UserService

+ (UserService *)userService
{
    if (!userService) {
        
        userService = [[super allocWithZone:NULL] init];
    }
    return userService;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self userService];
}

- (id)init
{
    
    if (userService) {
        
        
        return userService;
    }
    
    self = [super init];
    if (self) {
        
    }
    return self;
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

-(void) registerWith:(NSString*)carNum passWord:(NSString*)pwd realName:(NSString*)rName telephone:(NSString*)tel policyNum:(NSString*)pN{
    
    ASIFormDataRequest *request = [self request:@"http://58.248.185.165:85/WebService/service.asmx/RegisterAccount"];
    [request setPostValue:carNum forKey:@"CarNum"];
    [request setPostValue:pwd forKey:@"PassWord"];
    [request setPostValue:[NSNumber numberWithInt:3] forKey:@"UserClass"];
    [request setPostValue:rName forKey:@"RealName"];
    [request setPostValue:tel forKey:@"Telephone"];
    [request setPostValue:@"普通" forKey:@"VipClass"];
    [request setPostValue:pN forKey:@"PolicyNum"];
    [request setDelegate:[[RegisterAction alloc] init]];
    [request startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[AcModule sharedModule] foregroundViewController] view]  animated:YES];
    hud.labelText = @"用户注册中";


}
-(void) loginWithCarNum:(NSString*)username andPassword:(NSString*)pwd{
    //NSString* md5Pwd=[self MD5:pwd];
    ASIFormDataRequest *request = [self request:@"http://58.248.185.165:85/WebService/service.asmx/Login"];
    [request setPostValue:username forKey:@"username"];
    [request setPostValue:pwd forKey:@"password"];
    [request setPostValue:[NSNumber numberWithInt:3] forKey:@"userclass"];
    [request setPostValue:@"" forKey:@"imei"];
    [request setDelegate:[[LoginAction alloc] init]];
    [request startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[AcModule sharedModule] foregroundViewController] view] animated:YES];
    hud.labelText = @"用户登录中";
}

@end
