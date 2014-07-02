//
//  LoginViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
- (IBAction)back:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)endEditState:(id)sender;
@end
