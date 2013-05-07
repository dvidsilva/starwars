//
//  DVDCharacterViewController.h
//  StarWars
//
//  Created by Dvid Silva on 5/6/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVDCharacterModel.h"
#import "CafPlayer.h"

@interface DVDCharacterViewController : UIViewController

@property (strong, nonatomic) DVDCharacterModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) CafPlayer *player;


-(id)initWithModel: (DVDCharacterModel *) aModel;

-(IBAction)playSound:(id)sender;
-(IBAction)displayWiki:(id)sender;

@end
