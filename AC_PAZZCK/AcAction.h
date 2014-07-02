//
//  AcAction.h
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-15.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcAction : NSObject <ASIHTTPRequestDelegate,UIAlertViewDelegate>
-(void) sucess:(id)obj;
-(void) fail:(id)obj;
@end
