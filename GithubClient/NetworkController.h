//
//  NetworkController.h
//  GithubClient
//
//  Created by Tripta Gupta on 7/2/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

- (NSMutableArray *)reposForSearchString:(NSString *)searchString;

@end
