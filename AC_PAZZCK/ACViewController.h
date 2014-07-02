//
//  ACViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>

@interface UIViewController (UIViewControllerRedirectExtensions)

-(void) redirectModule:(NSString*)m;
-(void) redirectBack;

@end
