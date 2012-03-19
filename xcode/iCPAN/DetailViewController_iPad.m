//
//  DetailViewController_iPad.m
//  iCPAN
//
//  Created by Olaf Alders on 11-05-17.
//  Copyright 2011 wundersolutions.com. All rights reserved.
//

#import "DetailViewController_iPad.h"
#import "iCPANAppDelegate.h"
#import "Module.h"
#import "GRMustache.h"

@implementation DetailViewController_iPad

@synthesize popoverController=_myPopoverController;

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(Module *)managedObject
{
    
    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }	
	
    [super setDetailItem:managedObject];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    backButton.enabled = (webView.canGoBack);
    forwardButton.enabled = (webView.canGoForward);
    
    // CHECK: LANDSCAPE
    if ( (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) )
    {
        self.podViewer.frame = CGRectMake(self.podViewer.frame.origin.x, self.podViewer.frame.origin.y, 703, self.podViewer.frame.size.height);
    }
    // CHECK: PORTRAIT
    else
    {
        self.podViewer.frame = CGRectMake(self.podViewer.frame.origin.x, self.podViewer.frame.origin.y, 768, self.podViewer.frame.size.height);
    }
    
}


#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    barButtonItem.title = @"Search";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    self.popoverController = nil;
}

- (void)viewDidUnload
{
	[super viewDidUnload];
    
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
}

@end
