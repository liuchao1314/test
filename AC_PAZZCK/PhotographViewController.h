//
//  Photograph ViewController.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotographViewController : UIViewController <UIImagePickerControllerDelegate>
@property (strong) NSMutableDictionary* step;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePicture:(id)sender;

@end
