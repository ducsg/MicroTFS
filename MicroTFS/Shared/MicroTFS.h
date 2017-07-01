//
//  MicroTFS.h
//  MicroTFS
//
//  Created by Duc on 6/25/17.
//  Copyright © 2017 Duc Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const MicroTFSErrorDomain;

enum {
    AccessTokenCodeNullError = 1000,
    BaseURLNullError,
    NetWorkDisconnectError,
};

@class Project;

@class Team;

@class Iteration;

@class WorkItemType;

@class Member;

@interface MicroTFS : NSObject

@property (strong, nonatomic)  NSString *accessToken;

@property (strong, nonatomic)  NSString *baseUrl;

+(instancetype)shared;

/**
 Set MircoTFS instance with access token and Base url.

 @param code Access Token
 @param url Base URL
 */

+(void)setAccessToken:(NSString*)code withBaseUrl:(NSString*)url;

/**
 Get all team projects in the project collection that the authenticated user has access to.

 @param callback list of projects.
 */

+(void)listOfTeamProjects:(void (^)(NSMutableArray *projects, NSError *error))callback;

/**
 Get all teams within the project that the authenticated user has access to.
 
 @param project project model
 @param callback list of teams
 */

+(void)listOfTeamsWithinProject:(Project *)project completed:(void (^)(NSMutableArray *projects, NSError *error))callback;

/**
 Get a team's iterations within the team that the authenticated user has access to.

 @param team : team
 @param callback list of iteration
 */

+(void)listOfIterationsWithinTeam:(Team *)team completed:(void (^)(NSMutableArray *projects, NSError *error))callback;

/**
 Get a team's member within the team that the authenticated user has access to.

 @param team team
 @param callback list of member
 */
+(void)listOfMembersWithinTeam:(Team*)team completed:(void (^)(NSMutableArray *projects, NSError *error))callback;

/**
 Get a team's member within the team that the authenticated user has access to.

 @param project : project
 @param callback : list of work item type
 */
+(void)listOfWorkItemTypesWithinProject:(Project*)project completed:(void (^)(NSMutableArray *workItemType, NSError *error))callback;


/**
 Get a team's current Interation within the team that the authenticated user has access to.
 
 @param team : team
 @param callback : current Interation
 */

+(void)currentIterationsWithinTeam:(Team *)team completed:(void (^)(Iteration *current, NSError *error))callback;

@end
