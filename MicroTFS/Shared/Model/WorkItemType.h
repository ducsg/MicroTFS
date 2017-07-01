//
//  WorkItemType.h
//  Mobile IOS-TFS Connect
//
//  Created by NDVN HCM on 6/20/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkItemType : NSObject
@property (strong, nonatomic)  NSString *name;
@property (strong, nonatomic)  NSMutableArray *states;
- (id)initWithDictionay:(NSDictionary*)dictionary;

@end
