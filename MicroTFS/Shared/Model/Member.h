//
//  Member.h
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/20/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject
@property (strong, nonatomic)  NSString *displayName;
@property (strong, nonatomic)  NSString *identifer;
@property (strong, nonatomic)  NSString *uniqueName;

/**
 PARSE Member DATA
 
 @param dictionary JSON
 @return Member
 */
- (id)initWithDictionay:(NSDictionary*)dictionary;

@end
