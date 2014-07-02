//
//  ZzspListViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZzspListViewController : UITableViewController
@property (strong) NSDateFormatter* dateFormatter;
- (IBAction)back:(id)sender;
- (IBAction)cellButtonTapped:(id)sender;
@end
