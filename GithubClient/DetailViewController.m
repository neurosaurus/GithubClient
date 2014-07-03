 //
//  DetailViewController.m
//  GithubClient
//
//  Created by Tripta Gupta on 7/1/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setRepo:(id)newRepo
{
    if (_repo != newRepo) {
        _repo = newRepo;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.repo) {
        NSURL *repoURL = [NSURL URLWithString:[_repo objectForKey:@"html_url"]];
        NSURLRequest *repoRequest = [NSURLRequest requestWithURL:repoURL];
        [self.webView loadRequest:repoRequest];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
