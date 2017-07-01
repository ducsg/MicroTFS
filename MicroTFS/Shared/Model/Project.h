//
//  Project.h
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/19/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject
@property (strong, nonatomic)  NSString *name;
@property (strong, nonatomic)  NSString *systemId;

/**
 PARSE Project DATA
 
 @param dictionary JSON
 @return Project
 */
- (id)initWithDictionay:(NSDictionary*)dictionary;

@end
