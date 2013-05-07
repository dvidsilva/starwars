//
//  DVDWikiViewController.m
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDWikiViewController.h"

@interface DVDWikiViewController ()

@end

@implementation DVDWikiViewController

-(id)initWithModel:(DVDCharacterModel *) aModel{
    // when overwriting an init sending the parameters should do the same than sending or not nil for nibname and bundle, if the class was properly written
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        self.title = @"Wiki";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self browser] setDelegate:self];
    [self.browser loadRequest:[NSURLRequest
                               requestWithURL: [[self model] wikiPage] ] ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - UiWebView delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.activityView stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ups"
                                                    message: [error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil, nil ];
    [alert show];
}
-(BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
navigationType:(UIWebViewNavigationType) navigationType{
    if(navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeFormSubmitted || navigationType == UIWebViewNavigationTypeFormResubmitted ){
        return  NO;
    }else {
        return YES;
    }
}

@end
