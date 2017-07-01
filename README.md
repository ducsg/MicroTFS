
#MircoTFS follow TFS Microsoft API Kindly reffer below link:

https://www.visualstudio.com/en-us/docs/integrate/api/overview

You need go to your profile on TFS website, create new access token import to MircoTFS and Enjoy.


 1.Set MircoTFS instance with access token and Base url:

+(void)setAccessToken:(NSString*)code withBaseUrl:(NSString*)url;


 2.Get all team projects in the project collection that the authenticated user has access to:

+(void)listOfTeamProjects:(void (^)(NSMutableArray *projects, NSError *error))callback;


 3.Get all teams within the project that the authenticated user has access to:
 
+(void)listOfTeamsWithinProject:(Project *)project completed:(void (^)(NSMutableArray *projects, NSError *error))callback;


 4.Get a team's iterations within the team that the authenticated user has access to:

+(void)listOfIterationsWithinTeam:(Team *)team completed:(void (^)(NSMutableArray *projects, NSError *error))callback;


 5.Get a team's member within the team that the authenticated user has access to:

+(void)listOfMembersWithinTeam:(Team*)team completed:(void (^)(NSMutableArray *projects, NSError *error))callback;


 6.Get a team's member within the team that the authenticated user has access to:

+(void)listOfWorkItemTypesWithinProject:(Project*)project completed:(void (^)(NSMutableArray *workItemType, NSError *error))callback;


 7.Get a team's current Interation within the team that the authenticated user has access to:
 
+(void)currentIterationsWithinTeam:(Team *)team completed:(void (^)(Iteration *current, NSError *error))callback;
