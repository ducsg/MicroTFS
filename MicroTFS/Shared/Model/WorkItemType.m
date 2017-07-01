//
//  WorkItemType.m
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/20/17.
//  Copyright © 2017 com. All rights reserved.
//

#import "WorkItemType.h"
#import "State.h"
#define STATES_ORDER_BY  @[@"New",@"Approved",@"Committed",@"Done",@"Removed"]
@implementation WorkItemType

-(id)init {
    if ( self = [super init] ) {
    }
    return self;
}
- (id)initWithDictionay:(NSDictionary*)dictionary
{
    if ( self = [super init] ) {
        
    }
    
    self.name = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"name"]];
    
    NSDictionary * transitions = [dictionary objectForKey:@"transitions"];
    
    if (transitions != nil && ![transitions isEqual:[NSNull null]]) {
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:[transitions allKeys]];
        
        if (arr != nil && ![arr isEqual:[NSNull null]] && [arr count] > 0) {
            
            if ([arr containsObject:@""]) {[arr removeObject:@""];}
            
            
            NSMutableArray *allStates = [[NSMutableArray alloc]init];
            
            for (NSString *stateSort in STATES_ORDER_BY) {
                if ([arr containsObject:stateSort]) {
                    State *state = [[State alloc]init];
                    state.name = stateSort;
                    [allStates addObject:state];
                    [arr removeObject:stateSort];
                }
            }
            
            for (NSString *str in arr) {
                State *state = [[State alloc]init];
                state.name = str;
                [allStates addObject:state];
                //[arr removeObject:str];
            }
            arr = nil;
            self.states = allStates;
        }
        
    }
    
    return self;
    
}

@end
