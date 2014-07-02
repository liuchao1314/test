//
//  RegisterAction.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-13.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "RegisterAction.h"

@implementation RegisterAction
-(void) sucess:(id)obj{
       UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:@"注册成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

-(void) fail:(id)obj{
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:[obj objectForKey:@"msg"] delegate:self cancelButtonTitle:@"使用已有帐号登陆" otherButtonTitles:@"重新注册", nil];
    [alert show];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    if (buttonIndex==0) {
        [[[[AcModule sharedModule] foregroundViewController] navigationController] popViewControllerAnimated:YES];
    }
}

@end
