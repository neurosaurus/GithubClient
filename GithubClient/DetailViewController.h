//
//  DetailViewController.h
//  GithubClient
//
//  Created by Tripta Gupta on 7/1/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSMutableDictionary *repo;

@end
