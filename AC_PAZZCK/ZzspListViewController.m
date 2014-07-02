//
//  ZzspListViewController.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "ZzspListViewController.h"
#import "UserInfo.h"
#import "TaskCell.h"
#import "ZzspStore.h"
#import "TaskFlow.h"
#import "CurrentTaskFlow.h"
#import "CurrentTaskInfo.h"
#import "TaskService.h"
@interface ZzspListViewController ()

@end

@implementation ZzspListViewController
@synthesize dateFormatter;

- (IBAction)cellButtonTapped:(id)sender {
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    UIButton *button = sender;
    CGPoint correctedPoint =
    [button convertPoint:button.bounds.origin toView:self.tableView];
    NSIndexPath *indexPath =
    [self.tableView indexPathForRowAtPoint:correctedPoint];
    [[CurrentTaskInfo currentTaskInfo] setTaskInfo:[[[ZzspStore zzspStore] flowList] objectAtIndex:indexPath.row]];
    
    if ([[[[[ZzspStore zzspStore] flowList] objectAtIndex:indexPath.row] taskFlowdic] objectForKey:@"zzsp"]==nil) {
        [[AcModule sharedModule] setForegroundViewController:self];
        [[TaskService taskService] createTaskFlowWith:[[[[ZzspStore zzspStore] flowList] objectAtIndex:indexPath.row] taskID] taskflowtype:@"VIP理赔" caseType:@"双方事故"];
    }else{
        [[CurrentTaskFlow currentTaskFlow] setTaskFlow:[[[[CurrentTaskInfo currentTaskInfo] taskInfo] taskFlowdic] objectForKey:@"zzsp"]];
        ;
        [self redirectModule:@"flow"];
    }
}

-(id) init{
    return [super initWithNibName:nil bundle:nil];
    
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return [self init];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [super viewDidLoad];
    if( [[UserInfo sharedUser] user]==nil){
        [self redirectModule:@"user"];
    }
    self.dateFormatter= [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ZzspStore zzspStore] flowList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TaskCell *cell = [TaskCell cellForTableView:tableView
                                        fromNib:[TaskCell nib]];
    TaskInfo* task=[[[ZzspStore zzspStore] flowList] objectAtIndex:indexPath.row];
    
    cell.labelCaseNo.text=task.caseNo;
    
    cell.labelAddress.text=task.caseAddress;
    
    cell.labelDate.text=[self.dateFormatter stringFromDate:task.reportTime];
    
    [cell.btn addTarget:self action:@selector(cellButtonTapped:) forControlEvents:UIControlEventTouchDown];
    // Configure the cell...
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    
}


- (IBAction)back:(id)sender {
    [self redirectModule:@"main"];
}

@end
