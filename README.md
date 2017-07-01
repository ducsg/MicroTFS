
#MircoTFS follow TFS Microsoft API Kindly reffer below link:

https://www.visualstudio.com/en-us/docs/integrate/api/overview

You need go to your profile on TFS website, create new access token import to MircoTFS and Enjoy.

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
