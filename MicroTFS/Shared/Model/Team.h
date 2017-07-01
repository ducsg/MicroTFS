//
//  Team.h
//  Mobile IOS-TFS Connect
//
//  Created by BMW on 6/9/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Project;
@class Iteration;
@class State;
@interface Team : NSObject
@property (strong, nonatomic)  NSString *name;
@property (strong, nonatomic)  NSString *systemId;
@property (strong, nonatomic)  Project *fromProject;
@property (strong, nonatomic)  Iteration *currentIteration;
@property (strong, nonatomic)  NSMutableArray *states;

/**
 PARSE TEAM DATA
 @param  dictionary DATA
 @return Team
 */
- (id)initWithDictionay:(NSDictionary*)dictionary;

// Add work item for Team
- (void)setWorkItemsData:(NSMutableArray*)workItems;

@end
