#import "UserInfo.h"


static UserInfo *sharedUser = nil;

@implementation UserInfo
@synthesize user;
+ (UserInfo *)sharedUser
{
    if (!sharedUser) {
        
        sharedUser = [[super allocWithZone:NULL] init];
    }
    return sharedUser;
}


+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedUser];
}

- (id)init
{
    
    if (sharedUser) {
        
      
        return sharedUser;
    }
    
    self = [super init];
    if (self) {
        self.user=nil;
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





@end
