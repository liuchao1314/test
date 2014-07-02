//
//  LoginAction.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-13.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "LoginAction.h"
#import "User.h"
#import "ZzckStore.h"
#import "ZzspStore.h"
@implementation LoginAction
-(void) sucess:(id)obj{
    [super sucess:obj];
    NSLog(@"%@",[[[[obj objectForKey:@"msg"] JSONValue] objectAtIndex:0] class]);
    NSDictionary *userDictionary=[[[obj objectForKey:@"msg"] JSONValue] objectAtIndex:0];
    User* user=[[User alloc] init];
    user.userID=[userDictionary objectForKey:@"UserID"];
    user.relName=[userDictionary objectForKey:@"RealName"];
    user.telephone=[userDictionary objectForKey:@"Telephone"];
    user.imei=[userDictionary objectForKey:@"IMEI"];
    user.carNum=[userDictionary objectForKey:@"CarNum"];
    user.priorityNum=[userDictionary objectForKey:@"PriorityNum"];
    user.vipClass=[userDictionary objectForKey:@"VipClass"];
    user.thirdOrgan=[userDictionary objectForKey:@"ThirdOrgan"];
    user.groups=[userDictionary objectForKey:@"Groups"];
    
    [[UserInfo sharedUser] setUser:user];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:@"登陆成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

-(void) fail:(id)obj
{
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:@"用户名不正确或密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    if ([[UserInfo sharedUser] user]!=nil) {
        [[[AcModule sharedModule] foregroundViewController] redirectBack];
    }else{
         [[ZzckStore zzckStore] fetchFlowListIfNecessary];
         [[ZzspStore zzspStore] fetchFlowListIfNecessary];
    }
}


@end
