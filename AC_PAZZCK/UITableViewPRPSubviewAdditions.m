//
//  AppDelegate.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-8.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "UITableViewPRPSubviewAdditions.h"

@implementation UITableView (ACSubviewAdditions)

- (NSIndexPath *)ac_indexPathForRowContainingView:(UIView *)view {
    CGPoint correctedPoint = [view convertPoint:view.bounds.origin
                                         toView:self];
    return [self indexPathForRowAtPoint:correctedPoint];    
}

@end
