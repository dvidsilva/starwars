//
//  DVDWikiViewController.h
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVDCharacterModel.h"

@interface DVDWikiViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) DVDCharacterModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


-(id) initWithModel:(DVDCharacterModel *) aModel;

@end
