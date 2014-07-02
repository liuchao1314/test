//
//  ZzckStore.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "ZzckStore.h"
#import "User.h"
static ZzckStore* zzckStore=nil;
@implementation ZzckStore
@synthesize flowList;
+(ZzckStore*) zzckStore{
    if (!zzckStore) {
        zzckStore=[[super allocWithZone:nil] init];
    }
    return zzckStore;
}

+(id) allocWithZone:(NSZone *)zone{
    return [self zzckStore];
}

-(id) init{
    if (zzckStore) {
        return zzckStore;
    }
        
    self=[super init];
    if (self) {
        
    [self fetchFlowListIfNecessary];
        
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

- (NSString *)archivePath
{
    // The returned path will be Sandbox/Documents/possessions.data
    // Both the saving and loading methods will call this method to get the same path,
    // preventing a typo in the path name of either method
    NSString* fileName=[[[[UserInfo sharedUser] user] carNum] stringByAppendingString:@"-zzck.data"];
    NSLog(@"%@",fileName);
    return ac_PathInDocumentDirectory(fileName);
}

- (BOOL)saveChanges
{
    // returns success or failure
    return [NSKeyedArchiver archiveRootObject:flowList
                                       toFile:[self archivePath]];
}


- (void)fetchFlowListIfNecessary
{
    // If we don't currently have an allPossessions array, try to read one from disk
    if (!flowList) {
        NSString *path = [self archivePath];
        flowList = [[NSKeyedUnarchiver unarchiveObjectWithFile:path] retain];
    }
    
    // If we tried to read one from disk but does not exist, then create a new one
    if (!flowList) {
        flowList = [[NSMutableArray alloc] init];
    }
}

-(void) addTask:(TaskInfo*)task{
    [flowList addObject:task];
}

-(id) getTaskByID:(int)taskID{
    TaskInfo* task;
    for(int i=0;i<flowList.count;i++){
        if ([[[flowList objectAtIndex:i] taskID] intValue]==taskID) {
            task=[flowList objectAtIndex:i];
        }
    }
    return task;
}

@end
