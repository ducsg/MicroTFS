//
//  WorkItem.h
//  Mobile IOS-TFS Connect
//
//  Created by BMW on 5/30/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkItem : NSObject
@property (strong, nonatomic)  NSString *title;
@property (strong, nonatomic)  NSString *type;
@property (strong, nonatomic)  NSString *identifer;
@property (strong, nonatomic)  NSString *state;
@property (assign, nonatomic)  long priority;

/**
 PARSE PROJECT LIST

 @param dictionary jon
 @return Work item type
 */
- (id)initWithDictionay:(NSDictionary*)dictionary;

@end
