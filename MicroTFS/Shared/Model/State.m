//
//  WorkItem.m
//  Mobile IOS-TFS Connect
//
//  Created by BMW on 5/30/17.
//  Copyright © 2017 com. All rights reserved.
//

#import "State.h"

@implementation State

-(id)init {
    if ( self = [super init] ) {
    }
    self.total = 0;
    self.name = nil;
    return self;
}

- (id)initWithDictionay:(NSDictionary*)dictionary
{
    if ( self = [super init] ) {
        
    }
    self.name = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"System.State"]];
    self.total = 0;
    return self;
    
}
@end
