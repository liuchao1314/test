//
//  RegisterViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *carNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *policyNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UITextField *rePassWordTextField;
- (IBAction)register:(id)sender;
- (IBAction)endEditState:(id)sender;
@end
