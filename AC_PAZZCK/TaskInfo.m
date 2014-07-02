//
//  Task.m
//  AC_PAZZCK
//
//  Created by 陈 玉龙 on 12-8-18.
//  Copyright (c) 2012年 陈 玉龙. All rights reserved.
//

#import "TaskInfo.h"

@implementation TaskInfo
@synthesize taskID,caseType,caseNo,taskType,isRiskTask,riskType,carNum,carDriver,carOwnerName,carOwnerPhone,caseAddress,frontOperator,auditMount,latitude,longitude,blameRatio,upLoadTime,surveyTime,reportTime,carType,garageType,garageName,taskFlowdic;
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self) {
        [self setTaskID:[decoder decodeObjectForKey:@"taskID"]];
        [self setCaseNo:[decoder decodeObjectForKey:@"caseNo"]];
        [self setTaskType:[decoder decodeObjectForKey:@"taskType"]];
        [self setIsRiskTask:[decoder decodeObjectForKey:@"isRiskTask"]];
        [self setRiskType:[decoder decodeObjectForKey:@"riskType"]];
        [self setCarNum:[decoder decodeObjectForKey:@"carNum"]];
        [self setCarDriver:[decoder decodeObjectForKey:@"carDriver"]];
        [self setCarOwnerName:[decoder decodeObjectForKey:@"carOwnerName"]];
        [self setCarOwnerPhone:[decoder decodeObjectForKey:@"carOwnerPhone"]];
        [self setCaseAddress:[decoder decodeObjectForKey:@"caseAddress"]];
        [self setFrontOperator:[decoder decodeObjectForKey:@"frontOperator"]];
        [self setAuditMount:[decoder decodeObjectForKey:@"auditMount"]];
        [self setLatitude:[decoder decodeObjectForKey:@"latitude"]];
        [self setLongitude:[decoder decodeObjectForKey:@"longitude"]];
        [self setCaseType:[decoder decodeObjectForKey:@"caseType"]];
        [self setBlameRatio:[decoder decodeObjectForKey:@"blameRatio"]];
        [self setUpLoadTime:[decoder decodeObjectForKey:@"upLoadTime"]];
        [self setSurveyTime:[decoder decodeObjectForKey:@"surveyTime"]];
        [self setReportTime:[decoder decodeObjectForKey:@"reportTime"]];
        [self setCarType:[decoder decodeObjectForKey:@"carType"]];
        [self setGarageType:[decoder decodeObjectForKey:@"garageType"]];
        [self setGarageName:[decoder decodeObjectForKey:@"garageName"]];
        [self setTaskFlowdic:[decoder decodeObjectForKey:@"taskFlowdic"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:taskID forKey:@"taskID"];
    [encoder encodeObject:caseNo forKey:@"caseNo"];
    [encoder encodeObject:taskType forKey:@"taskType"];
    [encoder encodeObject:isRiskTask forKey:@"isRiskTask"];
    [encoder encodeObject:riskType forKey:@"riskType"];
    [encoder encodeObject:carNum forKey:@"carNum"];
    [encoder encodeObject:carDriver forKey:@"carDriver"];
    [encoder encodeObject:carOwnerName forKey:@"carOwnerName"];
    [encoder encodeObject:carOwnerPhone forKey:@"carOwnerPhone"];
    [encoder encodeObject:caseAddress forKey:@"caseAddress"];
    [encoder encodeObject:frontOperator forKey:@"frontOperator"];
    [encoder encodeObject:auditMount forKey:@"auditMount"];
    [encoder encodeObject:latitude forKey:@"latitude"];
    [encoder encodeObject:longitude forKey:@"longitude"];
    [encoder encodeObject:caseType forKey:@"caseType"];
    [encoder encodeObject:blameRatio forKey:@"blameRatio"];
    [encoder encodeObject:upLoadTime forKey:@"upLoadTime"];
    [encoder encodeObject:surveyTime forKey:@"surveyTime"];
    [encoder encodeObject:reportTime forKey:@"reportTime"];
    [encoder encodeObject:carType forKey:@"carType"];
    [encoder encodeObject:garageType forKey:@"garageType"];
    [encoder encodeObject:garageName forKey:@"garageName"];
    [encoder encodeObject:taskFlowdic forKey:@"taskFlowdic"];
}

-(id) initWithDic:(NSDictionary*)dic{
    taskID = [dic objectForKey:@"TaskID"];
    caseNo = [dic objectForKey:@"CaseNo"];
    taskType = [dic objectForKey:@"TaskType"];
    isRiskTask = [dic objectForKey:@"IsRiskTask"];
    riskType = [dic objectForKey:@"RiskType"];
    carNum = [dic objectForKey:@"CarNum"];
    carDriver = [dic objectForKey:@"CarDriver"];
    carOwnerName = [dic objectForKey:@"CarOwnerName"];
    carOwnerPhone = [dic objectForKey:@"CarOwnerPhone"];
    caseAddress = [dic objectForKey:@"caseAddress"];
    frontOperator = [dic objectForKey:@"FrontOperator"];
    auditMount = [dic objectForKey:@"AuditMount"];
    latitude = [dic objectForKey:@"Latitude"];
    longitude = [dic objectForKey:@"Longitude"];
    caseType = [dic objectForKey:@"CaseType"];
    blameRatio = [dic objectForKey:@"BlameRatio"];
    upLoadTime = [dic objectForKey:@"UpLoadTime"];
    surveyTime = [dic objectForKey:@"SurveyTime"];
    reportTime = [dic objectForKey:@"ReportTime"];
    carType = [dic objectForKey:@"CarType"];
    garageType = [dic objectForKey:@"GarageType"];
    garageName = [dic objectForKey:@"GarageName"];
    taskFlowdic=[[NSMutableDictionary alloc] init];
    return self;
}



@end
