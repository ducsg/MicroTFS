//
//  Iteration.m
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/15/17.
//  Copyright © 2017 com. All rights reserved.
//

#import "Iteration.h"
#import "Team.h"
@implementation Iteration
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
    self.systemId = idStr == nil ? @"" : idStr;

    NSString * nameStr = [dictionary objectForKey:@"name"];
    self.name = nameStr == nil ? @"" : nameStr;

    NSDictionary *attributes = [dictionary objectForKey:@"attributes"];
    if (attributes != nil) {
        NSDateFormatter *newDateFormatter = [[NSDateFormatter alloc]init];
        [newDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        NSString *startDateStr = [attributes objectForKey:@"startDate"];
        NSString *finishDateStr = [attributes objectForKey:@"finishDate"];
        if (startDateStr != nil && ![startDateStr isEqual:[NSNull null]] && [startDateStr length] > 0) {
            _startDate = [newDateFormatter dateFromString:startDateStr];
        }
        if (finishDateStr != nil && ![startDateStr isEqual:[NSNull null]] && [finishDateStr length] > 0) {
            _finishDate = [newDateFormatter dateFromString:finishDateStr];
        }

    }
    
    
    return self;
    
}

@end
