//
//  DVDCharacterViewController.m
//  StarWars
//
//  Created by Dvid Silva on 5/6/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDCharacterViewController.h"
#import "DVDWikiViewController.h"

@implementation DVDCharacterViewController

-(id)initWithModel: (DVDCharacterModel *) aModel{
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model = aModel;
        _player = [CafPlayer cafPlayer];
        self.title = aModel.alias;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [self syncViewWithModel];
    //Sincronizamos controlador y vistas
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions

-(IBAction)playSound:(id)sender{
    [self.player playSoundData:self.model.soundData];
}
-(IBAction)displayWiki:(id)sender{
    DVDWikiViewController *wikiVC = [[DVDWikiViewController alloc]
                                     initWithModel:self.model];
    [self.navigationController pushViewController:wikiVC
                                         animated:NO];
}

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc{

    self.navigationItem.leftBarButtonItem = barButtonItem;
}


-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - DVDCharactersViewControllerDelegate

-(void)charactersViewController:(DVDCharactersViewController *)vc
             didSelectCharacter:(DVDCharacterModel *)aCharacter{
    //tu modelo cambio, actualiza la info
    self.model = aCharacter;
    //muestra la nueva info
    [self syncViewWithModel];
    //[self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma  mark - Utils

-(void)syncViewWithModel {
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;
}
@end
