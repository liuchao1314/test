//
//  AppDelegate.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-8.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UITableView (ACSubviewAdditions)

- (NSIndexPath *)ac_indexPathForRowContainingView:(UIView *)view;

@end
