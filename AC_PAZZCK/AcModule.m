//
//  AcModule.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-12.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "AcModule.h"
static AcModule *sharedModule = nil;
@implementation AcModule
@synthesize foregroundViewController;
+ (AcModule *)sharedModule
{
    if (!sharedModule) {
        
        sharedModule = [[super allocWithZone:NULL] init];
    }
    return sharedModule;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedModule];
}

- (id)init
{
    
    if (sharedModule) {
        
        
        return sharedModule;
    }
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)retain
{
    
    return self;
}

- (void)release
{
    
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

-(void)setModule:(NSString*)module{
    [previousModule release];
    [module retain];
    previousModule=currentModule;
    currentModule=module;
}
-(NSString*) previousModule{
    return previousModule;
}

-(NSString*) currentModule{
    return currentModule;
}

@end
