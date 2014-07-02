//
//  TaskCell.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-19.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell
@synthesize progress;
@synthesize labelCaseNo;
@synthesize labelDate;
@synthesize labelAddress;
@synthesize labelProgressData;
@synthesize btn;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
