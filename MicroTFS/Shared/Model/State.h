//
//  WorkItem.h
//  Mobile IOS-TFS Connect
//
//  Created by BMW on 5/30/17.
//  Copyright © 2017 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject
@property (strong, nonatomic)  NSString *name;
@property (assign, nonatomic)  long total;
@property (strong, nonatomic)  NSMutableArray *workItems;


/**
 PARSE STATE DATA

 @param dictionary json dictionary
 @return State
 */
- (id)initWithDictionay:(NSDictionary*)dictionary;

@end
