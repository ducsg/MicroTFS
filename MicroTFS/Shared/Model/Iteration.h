//
//  Iteration.h
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/15/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Team;
@interface Iteration : NSObject
@property (strong, nonatomic)  NSString *name;
@property (strong, nonatomic)  NSString *systemId;
@property (strong, nonatomic)  NSDate *startDate;
@property (strong, nonatomic)  NSDate *finishDate;
@property (strong, nonatomic)  Team *fromTeam;


/**
 PARSE TEAM DATA

 @param dictionary JSON
 @return TEAM
 */
- (id)initWithDictionay:(NSDictionary*)dictionary;

@end
