//
//  NetworkController.m
//  GithubClient
//
//  Created by Tripta Gupta on 7/2/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

- (NSArray *)reposForSearchString:(NSString *)searchString
{
    searchString = [NSString stringWithFormat:@"https://api.github.com/search/repositories?q=%@", searchString];
    NSURL *searchURL = [NSURL URLWithString:searchString];
    NSData *searchData = [NSData dataWithContentsOfURL:searchURL];
    NSError *error;
    NSMutableDictionary *searchDict = [NSJSONSerialization JSONObjectWithData:searchURL
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:&error];
    if (error) {
        NSLog(@"Error deserializing JSON: %@", error.debugDescription);
    } else {
        NSMutableArray *repos = [searchDict objectForKey:@"items"];
        return repos;
    }
    
    return @[error]; 
}

@end
