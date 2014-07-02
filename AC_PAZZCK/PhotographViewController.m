//
//  Photograph ViewController.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-21.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "PhotographViewController.h"
#import "CurrentTaskFlow.h"
#import "ImageStore.h"
@interface PhotographViewController ()

@end

@implementation PhotographViewController
@synthesize labelTitle;
@synthesize imageView;
@synthesize step;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
        self.title=[self.step objectForKey:@"title"];
    self.labelTitle.text=[self.step objectForKey:@"title"];
    if ([[self.step objectForKey:@"isExist"] boolValue]) {
        [self.imageView setImage:[[ImageStore defaultImageStore] imageForKey:[self.step objectForKey:@"imageKey"]]];
    }else{
    [self.imageView setImage:[UIImage imageNamed:[self.step objectForKey:@"imageKey"]]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLabelTitle:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    
    // If our device has a camera, we want to take a picture, otherwise, we
    // just pick from photo library
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePicker setDelegate:self];

    [self presentModalViewController:imagePicker animated:YES];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@  --  %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    
    NSString *oldKey = [[[[CurrentTaskFlow currentTaskFlow] taskFlow] flowList] objectAtIndex:[[self.step objectForKey:@"stepNo"] integerValue]];
    if (oldKey && [[self.step objectForKey:@"isExist"] boolValue] ) {
        
        [[ImageStore defaultImageStore] deleteImageForKey:oldKey];
    }
    
        
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
 
    CFStringRef newUniqueIDString =CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
   NSString* key=(__bridge NSString *)newUniqueIDString;
  
    [self.step setObject:key forKey:@"imageKey"];
    
    [[ImageStore defaultImageStore] setImage:image forKey:key];
    
    [self.step setObject:[NSNumber numberWithBool:YES] forKey:@"isExist"];
  

    [self dismissModalViewControllerAnimated:YES];
     
     
   
}


@end
