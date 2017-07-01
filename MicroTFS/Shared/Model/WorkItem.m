//
//  WorkItem.m
//  Mobile IOS-TFS Connect
//
//  Created by BMW on 5/30/17.
//  Copyright © 2017 com. All rights reserved.
//

#import "WorkItem.h"

@implementation WorkItem

-(id)init {
    if ( self = [super init] ) {
    }
    return self;
}
- (id)initWithDictionay:(NSDictionary*)dictionary
{
    if ( self = [super init] ) {
        
    }
    self.identifer = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"System.Id"]];
    
    self.title = [dictionary objectForKey:@"System.Title"];
    self.state = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"System.State"]];
    self.type = [dictionary objectForKey:@"System.WorkItemType"];
    NSNumber *num = [dictionary objectForKey:@"Microsoft.VSTS.Common.Priority"];
    self.priority = [num longValue];
    return self;
    
}
@end
