//
//  DVDWikiViewController.m
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDWikiViewController.h"
#import "DVDCharacterArray.h"
#import "DVDCharactersViewController.h"

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

#pragma  mark - Begin listen to notification
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // nos damos de alta en las notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(characterDidChange:)
               name:CHARACTER_DID_CHANGE_NOTIFICATION
             object:nil
     ];
    
    
    //asignamos delegado
    [[self browser] setDelegate:self];
    
    //sincronizamos vista y modelo
    [self syncWithViewModel];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma  mark - Utils
//sincronizar vista y modelo
-(void)syncWithViewModel {
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];
    [self.browser loadRequest:[NSURLRequest
                               requestWithURL:[[self model] wikiPage]]];
}
-(void)characterDidChange:(NSNotification *)notification{
    //Extraer el user info
    NSDictionary *info = [notification userInfo];
    //averiguar que personaje es
    DVDCharacterModel *character = [info objectForKey:CHARACTER_KEY];
    //actualizar el modelo
    self.model = character;
    //sincronizar las vistas
    [self syncWithViewModel];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - UiWebView delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityView setHidden:YES];
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
