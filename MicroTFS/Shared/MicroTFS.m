//
//  MicroTFS.m
//  MicroTFS
//
//  Created by Duc on 6/25/17.
//  Copyright © 2017 Duc Ngo. All rights reserved.
//

#import "MicroTFS.h"
#import "Project.h"
#import "TFSURI.h"
#import "Project.h"
#import "Team.h"
#import "WorkItem.h"
#import "WorkItemType.h"
#import "Member.h"


NSString *const MicroTFSErrorDomain = @"com.hd.MicroTFS";

@implementation MicroTFS

+(instancetype)shared
{
    static MicroTFS *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[MicroTFS alloc] init];

    });
    return shared;
}

+(void)setAccessToken:(NSString*)code withBaseUrl:(NSString*)url
{
    MicroTFS * shared =[MicroTFS shared];
    [shared setAccessToken:code];
    [shared setBaseUrl:url];
}

-(NSString*)joinURI:(NSArray*)components {
    NSString *uri = [components componentsJoinedByString:@""];

    return uri;
}

-(void)getMethodRequestFrom:(NSString*)url completionHandler :(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    
    [request setValue:[[MicroTFS shared] accessToken] forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    callback(data,response,error);
                                                }];
    
    [dataTask resume];
    return;
}

+(void)listOfTeamProjects:(void (^)(NSMutableArray *projects, NSError *error))callback
{

    MicroTFS *shared = [MicroTFS shared];
    
    NSError *error =  nil;
    
    if ([shared accessToken] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:AccessTokenCodeNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    
    if ([shared baseUrl] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:BaseURLNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    
    
    [shared getMethodRequestFrom:[shared joinURI:@[[shared baseUrl],PROJECT_URI]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *mutableArray = nil;
        if (error) {
            callback(nil,error);
            
        } else {
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            NSArray *arrray = [json objectForKey:@"value"];
            if (arrray != nil && ![arrray isEqual:[NSNull null]] && [arrray count] > 0) {
                mutableArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in arrray) {
                    Project *p = [[Project alloc]initWithDictionay:dic];
                    [mutableArray addObject:p];
                }
            } else {
                mutableArray = nil;
            }
        }
        callback(mutableArray,nil);

    }];
}

+(void)listOfTeamsWithinProject:(Project *)project completed:(void (^)(NSMutableArray *projects, NSError *error))callback
{
    MicroTFS *shared = [MicroTFS shared];
    
    NSError *error =  nil;
    
    if ([shared accessToken] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:AccessTokenCodeNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    
    if ([shared baseUrl] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:BaseURLNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    NSString * URI = [NSString stringWithFormat:ALL_TEAM_URI,project.systemId];

    [shared getMethodRequestFrom:[shared joinURI:@[shared.baseUrl,URI]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *mutableArray = nil;
        if (error) {
            callback(nil,error);
            
        } else {
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            NSArray *arrray = [json objectForKey:@"value"];
            if (arrray != nil && ![arrray isEqual:[NSNull null]] && [arrray count] > 0) {
                mutableArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in arrray) {
                    Project *p = [[Project alloc]initWithDictionay:dic];
                    [mutableArray addObject:p];
                }
            } else {
                mutableArray = nil;
            }
        }
        callback(mutableArray,nil);
        
    }];

}

+(void)listOfIterationsWithinTeam:(Team *)team completed:(void (^)(NSMutableArray *, NSError *))callback
{
    MicroTFS *shared = [MicroTFS shared];
    
    NSError *error =  nil;
    
    if ([shared accessToken] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:AccessTokenCodeNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    
    if ([shared baseUrl] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:BaseURLNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    NSString * URI = [NSString stringWithFormat:ALL_ITERATION_URI,team.fromProject.systemId,team.systemId];
    
    [shared getMethodRequestFrom:[shared joinURI:@[shared.baseUrl,URI]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *mutableArray = nil;
        if (error) {
            callback(nil,error);
            
        } else {
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            NSArray *arrray = [json objectForKey:@"value"];
            if (arrray != nil && ![arrray isEqual:[NSNull null]] && [arrray count] > 0) {
                mutableArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in arrray) {
                    Team *t = [[Team alloc]initWithDictionay:dic];
                    [mutableArray addObject:t];
                }
            } else {
                mutableArray = nil;
            }
        }
        callback(mutableArray,nil);
        
    }];

}

+(void)listOfMembersWithinTeam:(Team *)team completed:(void (^)(NSMutableArray *, NSError *))callback
{
    MicroTFS *shared = [MicroTFS shared];
    
    NSError *error =  nil;
    
    if ([shared accessToken] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:AccessTokenCodeNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    
    if ([shared baseUrl] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:BaseURLNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    NSString * URI = [NSString stringWithFormat:ALL_MEMBER_URI,team.fromProject.systemId,team.systemId];
    
    [shared getMethodRequestFrom:[shared joinURI:@[shared.baseUrl,URI]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *mutableArray = nil;
        if (error) {
            callback(nil,error);
            
        } else {
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            NSArray *arrray = [json objectForKey:@"value"];
            if (arrray != nil && ![arrray isEqual:[NSNull null]] && [arrray count] > 0) {
                mutableArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in arrray) {
                    Member *mem = [[Member alloc]initWithDictionay:dic];
                    [mutableArray addObject:mem];
                }
            } else {
                mutableArray = nil;
            }
        }
        callback(mutableArray,nil);
        
    }];

}
+(void)listOfWorkItemTypesWithinProject:(Project *)project completed:(void (^)(NSMutableArray *, NSError *))callback
{
    MicroTFS *shared = [MicroTFS shared];
    
    NSError *error =  nil;
    
    if ([shared accessToken] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:AccessTokenCodeNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    
    if ([shared baseUrl] == nil) {
        error = [NSError errorWithDomain:MicroTFSErrorDomain code:BaseURLNullError userInfo:nil];
        callback(nil,error);
        return;
    };
    NSString * URI = [NSString stringWithFormat:ALL_WORKITEM_URI,project.systemId];
    
    [shared getMethodRequestFrom:[shared joinURI:@[shared.baseUrl,URI]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *mutableArray = nil;
        if (error) {
            callback(nil,error);
            
        } else {
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            NSArray *arrray = [json objectForKey:@"value"];
            if (arrray != nil && ![arrray isEqual:[NSNull null]] && [arrray count] > 0) {
                mutableArray = [[NSMutableArray alloc]init];
                for (NSDictionary *dic in arrray) {
                    WorkItemType *mem = [[WorkItemType alloc]initWithDictionay:dic];
                    [mutableArray addObject:mem];
                }
            } else {
                mutableArray = nil;
            }
        }
        callback(mutableArray,nil);
        
    }];

}
+(void)currentIterationsWithinTeam:(Team *)team completed:(void (^)(Iteration *, NSError *))callback
{

}
@end
