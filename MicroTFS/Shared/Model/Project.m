//
//  Project.m
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/19/17.
//  Copyright © 2017 com. All rights reserved.
//

#import "Project.h"

@implementation Project
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
    
    return self;
    
}

@end
