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
    [super viewWillAppear: animated ];
    self.photoView.image = self.model.photo;
    /* self.navigationController.navigationBar.tintColor = [UIColor
                                                         colorWithRed:0
                                                         green:0
                                                         blue:0.23
                                                         alpha:1];
    */
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


@end
