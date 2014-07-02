//
//  TaskCell.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPNibBasedTableViewCell.h"
@interface TaskCell : PRPNibBasedTableViewCell
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *labelCaseNo;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelAddress;
@property (weak, nonatomic) IBOutlet UILabel *labelProgressData;
@property (weak, nonatomic) IBOutlet UIButton *btn;


@end
