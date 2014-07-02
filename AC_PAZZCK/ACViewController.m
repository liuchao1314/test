//
//  ACViewController.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "ACViewController.h"
#import "MainViewController.h"

@implementation UIViewController (UIViewControllerRedirectExtensions)
-(void) redirectModule:(NSString*)m{
    [[AcModule sharedModule] setModule:m];
    UIViewController* viewController;
    if ([m isEqualToString:@"main"]) {
        viewController=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
;
    }else{
        NSString* storyboardName=[m stringByAppendingString:@"Storyboard"];
        UIStoryboard* sb=[UIStoryboard storyboardWithName:storyboardName bundle:nil];
        viewController=[sb instantiateInitialViewController];
    }
     [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}

-(void) redirectBack{
    [self redirectModule:[[AcModule sharedModule] previousModule]];
}



@end
