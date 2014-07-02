//
//  MainViewController.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-9.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(id) init{
    self = [super initWithNibName:@"MainViewController" bundle:nil];
    if (self) {
        // Custom initialization
       
    }
    return self;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"mainViewDidLoad");
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)baoan:(id)sender {
    NSLog(@"加载一键报案模块");
    [self redirectModule:@"yjba"];
}

- (IBAction)kancha:(id)sender {
    NSLog(@"加载资助勘察模块");
    [self redirectModule:@"zzck"];
}

- (IBAction)suopei:(id)sender {
    NSLog(@"加载自助索赔模块");
    [self redirectModule:@"zzsp"];
}

- (IBAction)chexian:(id)sender {
    NSLog(@"加载车险服务模块");
    [self redirectModule:@"cxfw"];
}

- (IBAction)mendian:(id)sender {
    NSLog(@"加载门店查询模块");
    [self redirectModule:@"mdcx"];
}
@end
