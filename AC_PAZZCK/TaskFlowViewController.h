//
//  TaskFlowViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskFlowViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)back:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction) btnClick:(id)sender;
-(void)upload;
-(void) goStep:(int)step;
@end
