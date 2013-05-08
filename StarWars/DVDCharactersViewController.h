//
//  DVDCharactersViewController.h
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVDCharacterArray.h"
#import "DVDCharacterViewController.h"


#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

#define CHARACTER_DID_CHANGE_NOTIFICATION @"characterDidChangeNotification"
#define CHARACTER_KEY @"CharacterKey"


@class  DVDCharactersViewController;

@protocol  DVDCharactersViewControllerDelegate <NSObject>
@optional
-(void)charactersViewController: (DVDCharactersViewController *)vc
                      didSelectCharacter:(DVDCharacterModel *)aCharacter;


@end


@interface DVDCharactersViewController : UITableViewController

@property (weak, nonatomic) id delegate;
-(id) initWithStyle:(UITableViewStyle)aStyle
              model:(DVDCharacterArray *) aModel;


@end
