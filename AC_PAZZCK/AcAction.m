//
//  AcAction.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-15.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "AcAction.h"

@implementation AcAction
-(void) sucess:(id)obj{
    for (NSString* s in obj) {
        NSLog(@"%@:%@",s,[obj objectForKey:s]);
    }

}
-(void) fail:(id)obj{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:[obj objectForKey:@"msg"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    [MBProgressHUD hideHUDForView:[[[AcModule sharedModule] foregroundViewController] view] animated:YES];
        if (request.responseStatusCode == 400) {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:@"服务器无法识别您的请求" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    } else if (request.responseStatusCode == 403) {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"" message:@"网络资源不可用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    } else if (request.responseStatusCode == 200) {
        
        NSData *responseData = [request responseData];
        id responseObj = [responseData JSONValue];
       
        
       
        if ([[responseObj objectForKey:@"success"] boolValue]) {
            [self sucess:responseObj];
            
        }else{
            [self fail:responseObj];
        }
        
    } else {
        NSLog(@"Unexpected error");
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:[[[AcModule sharedModule] foregroundViewController] view] animated:YES];
    NSError *error = [request error];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:error.localizedDescription delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil ];
    [alert show];
}


@end
