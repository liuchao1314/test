//
//  TaskFlowViewController.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "TaskFlowViewController.h"
#import "CurrentTaskFlow.h"
#import "TaskFlow.h"
#import "PhotographViewController.h"
@interface TaskFlowViewController ()

@end

@implementation TaskFlowViewController
@synthesize textView;
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.contentSize=CGSizeMake(320, 520);
    TaskFlow* flow=[[CurrentTaskFlow currentTaskFlow]  taskFlow];
    if ([[[AcModule sharedModule] previousModule] isEqualToString:@"zzck"]) {
        self.navigationItem.title=@"自助查勘";
    }else if([[[AcModule sharedModule] previousModule] isEqualToString:@"zzsp"]){
        self.navigationItem.title=@"自助索赔";
    }
    
    UIButton* btn;
    UIImageView *imgView;
    UIImage* img=[UIImage imageNamed:@"location_right_unpressed.png"];
    for (int i=0; i<flow.flowList.count; i++) {
        btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:[[flow.flowList objectAtIndex:i] objectForKey:@"title"] forState:0];
        [btn setFrame:CGRectMake(60, i*80+80, 200, 50)];
        if (i<flow.flowList.count-1) {
            imgView=[[UIImageView alloc] initWithImage:img];
            imgView.transform=CGAffineTransformMakeRotation(90*M_PI/180);
            imgView.frame=CGRectMake(150, i*80+140, img.size.width, img.size.height);
            [self.scrollView addSubview:imgView];

        }
        btn.tag=i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self.scrollView addSubview:btn];
    }

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)back:(id)sender {
    [self redirectBack];
}

- (IBAction)nextStep:(id)sender {
    
}

- (IBAction) btnClick:(id)sender
{
    UIButton* btn=(UIButton*)sender;
   
        [self goStep:btn.tag];

}

-(void) goStep:(int)step{
    PhotographViewController* ctl=[[PhotographViewController alloc] initWithNibName:nil bundle:nil];
    [ctl setStep:[[[[CurrentTaskFlow currentTaskFlow] taskFlow] flowList] objectAtIndex:step]];
    [self.navigationController pushViewController:ctl animated:YES];
    
  }

-(void)upload{

}

@end
