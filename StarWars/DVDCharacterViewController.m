//
//  DVDCharacterViewController.m
//  StarWars
//
//  Created by Dvid Silva on 5/6/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDCharacterViewController.h"

@implementation DVDCharacterViewController

-(id)initWithModel: (DVDCharacterModel *) aModel{
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model = aModel;
        _player = [CafPlayer cafPlayer];
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated ];
    self.photoView.image = self.model.photo;
    //Sincronizamos controlador y vistas
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions

-(IBAction)playSound:(id)sender{
    [self.player playSoundData:self.model.soundData];
}

@end
