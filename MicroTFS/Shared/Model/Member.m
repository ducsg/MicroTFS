//
//  Member.m
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/20/17.
//  Copyright © 2017 com. All rights reserved.
//

#import "Member.h"

@implementation Member
-(id)init {
    if ( self = [super init] ) {
    }
    return self;
}
- (id)initWithDictionay:(NSDictionary*)dictionary
{
    if ( self = [super init] ) {
        
    }
    
    self.identifer = [NSString stringWithFormat:@"%@", [dictionary objectForKey:@"id"]];
    
    self.displayName = [dictionary objectForKey:@"displayName"];
    
    self.uniqueName = [dictionary objectForKey:@"uniqueName"];

    return self;
    
}

@end
