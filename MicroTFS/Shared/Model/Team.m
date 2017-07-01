//
//  Team.m
//  Mobile IOS-TFS Connect
//
//  Created by BMW on 6/9/17.
//  Copyright © 2017 com. All rights reserved.
//
#import "Project.h"
#import "Team.h"
#import "Iteration.h"
#include "State.h"
@implementation Team
-(id)init {
    if ( self = [super init] ) {
    }
    return self;
}

- (id)initWithDictionay:(NSDictionary*)dictionary
{
    if ( self = [super init] ) {
        
    }
    
    NSString * idStr = [dictionary objectForKey:@"id"];
    
    NSString * nameStr = [dictionary objectForKey:@"name"];
 
    self.systemId = idStr == nil ? @"" : idStr;
    
    self.name = nameStr == nil ? @"" : nameStr;
    
    self.currentIteration = nil;
    
    self.fromProject = nil;
    
    self.states = nil;
    
    return self;
    
}

-(void)setWorkItemsData:(NSMutableArray *)workItems
{
    _states = [[NSMutableArray alloc]init];
    NSArray *array = [workItems valueForKeyPath:@"@distinctUnionOfObjects.state"];
    for (NSString *stateName in array) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.state = %@", stateName];
        NSArray *results = [workItems filteredArrayUsingPredicate:predicate];
        long count = [results count];
        State *state = [[State alloc]init];
        [state setWorkItems:[NSMutableArray arrayWithArray:results]];
        [state setName:stateName];
        [state setTotal:count];
        [_states addObject:state];
    }

}

@end
