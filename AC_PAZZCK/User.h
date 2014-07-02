//
//  User.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-14.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSNumber* userID;
    NSString* passWord;
    NSString* relName;
    NSString* telephone;
    NSString* imei;
    NSString* carNum;
    NSString* priorityNum;
    NSString* vipClass;
    NSString* thirdOrgan;
    NSString* groups;
}
@property (strong) NSNumber* userID;
@property (strong) NSString* passWord;
@property (strong) NSString* relName;
@property (strong) NSString* telephone;
@property (strong) NSString* imei;
@property (strong) NSString* carNum;
@property (strong) NSString* priorityNum;
@property (strong) NSString* vipClass;
@property (strong) NSString* thirdOrgan;
@property (strong) NSString* groups;

@end
