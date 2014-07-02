//
//  AcModule.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcModule : NSObject
{
    NSString* currentModule;
    NSString* previousModule;
    UIViewController* foregroundViewController;
}
@property (weak,atomic) UIViewController* foregroundViewController;
+(AcModule*) sharedModule;
-(void)setModule:(NSString*)module;
-(NSString*) previousModule;
-(NSString*) currentModule;
@end
