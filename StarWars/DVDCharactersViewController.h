//
//  DVDCharactersViewController.h
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVDCharacterArray.h"

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1


@interface DVDCharactersViewController : UITableViewController
-(id) initWithStyle:(UITableViewStyle)aStyle
              model:(DVDCharacterArray *) aModel;


@end
