//
//  CreateTaskViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-17.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateTaskViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *caseno;
@property (weak, nonatomic) IBOutlet UISegmentedControl *caseType;
@property (weak, nonatomic) IBOutlet UISegmentedControl *garageType;
- (IBAction)createTask:(id)sender;
- (IBAction)select:(id)sender;
- (IBAction)endEditState:(id)sender;

@end
