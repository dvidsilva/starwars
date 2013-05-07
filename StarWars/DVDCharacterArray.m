//
//  DVDCharacterArray.m
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDCharacterArray.h"

@interface DVDCharacterArray ()
//al declarar las propiedades aca el compilador no va a mostrarlas cuando muestre las propiedades publicas
@property (strong, nonatomic) NSArray *rebels;
@property (strong, nonatomic) NSArray *imperials;

@end

@implementation DVDCharacterArray
#pragma mark - getters

-(int)rebelCount{
    return [self.rebels count];
}
-(int)imperialCount{
    return [self.imperials count];
}

#pragma  mark - Initializadores 

-(id) init {
    if(self = [super init]) {
        // creamos un modelo // Darth Vader
        NSURL * vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        NSData *vaderSound = [NSData dataWithContentsOfURL:
                              [ [NSBundle mainBundle] URLForResource:@"vader" withExtension:@"caf"]
                              ];
        
        UIImage *vaderPhoto = [UIImage imageNamed:@"darthVader.jpg"];
        
        DVDCharacterModel *vader = [DVDCharacterModel
                                    characterModelWithFirstName: @"Anakin"
                                    lastName: @"Skywalker"
                                    alias: @"Darth Vader"
                                    wikiPage: vaderURL
                                    soundData: vaderSound
                                    photo: vaderPhoto ];
        //C3-PO
        NSURL * c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:
                             [ [NSBundle mainBundle] URLForResource:@"c3po" withExtension:@"caf"]
                             ];
        UIImage *c3poPhoto = [UIImage imageNamed:@"c3po.jpg"];
        DVDCharacterModel *c3po = [DVDCharacterModel
                                   characterModelWithAlias: @"C-3PO"
                                   wikiPage: c3poURL
                                   soundData: c3poSound
                                   photo: c3poPhoto ];
        
        //Chewbacca
        NSURL * chewbaccaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        NSData *chewbaccaSound = [NSData dataWithContentsOfURL:
                                  [ [NSBundle mainBundle] URLForResource:@"chewbacca" withExtension:@"caf"]
                                  ];
        UIImage *chewbaccaPhoto = [UIImage imageNamed:@"chewbacca.jpg"];
        DVDCharacterModel *chewbacca = [DVDCharacterModel
                                        characterModelWithAlias: @"Chewbacca"
                                        wikiPage: chewbaccaURL
                                        soundData: chewbaccaSound
                                        photo: chewbaccaPhoto ];
        
        //Palpatine
        NSURL * palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        NSData *palpatineSound = [NSData dataWithContentsOfURL:
                                  [ [NSBundle mainBundle] URLForResource:@"palpatine" withExtension:@"caf"]
                                  ];
        UIImage *palpatinePhoto = [UIImage imageNamed:@"palpatine.jpg"];
        DVDCharacterModel *palpatine = [DVDCharacterModel
                                        characterModelWithFirstName: @""
                                        lastName: @"Palpatine"
                                        alias: @"Darth Sidious"
                                        wikiPage: palpatineURL
                                        soundData: palpatineSound
                                        photo: palpatinePhoto ];
        
        //R2D2
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:
                             [ [NSBundle mainBundle] URLForResource:@"rd-d2" withExtension:@"caf"]
                             ];
        UIImage *r2d2Photo = [UIImage imageNamed:@"R2-D2.jpg"];
        DVDCharacterModel *r2d2 = [DVDCharacterModel
                                   characterModelWithAlias: @"R2-D2"
                                   wikiPage: r2d2URL
                                   soundData: r2d2Sound
                                   photo: r2d2Photo ];
        
        //Yoda
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:
                             [ [NSBundle mainBundle] URLForResource:@"yoda" withExtension:@"caf"]
                             ];
        UIImage *yodaPhoto = [UIImage imageNamed:@"yoda.jpg"];
        DVDCharacterModel *yoda = [DVDCharacterModel
                                   characterModelWithFirstName: @"Minch"
                                   lastName: @"Yoda"
                                   alias: @"Master Yoda"
                                   wikiPage: yodaURL
                                   soundData: yodaSound
                                   photo: yodaPhoto ];
        
        self.rebels = @[chewbacca,c3po, yoda, r2d2];
        self.imperials =@[palpatine, vader];
    }
    return self;
}

-(DVDCharacterModel *) rebelCharacterAtIndex: (int) anIndex{
    return [self.rebels objectAtIndex:anIndex];
}

-(DVDCharacterModel *) imperialCharacterAtIndex: (int) anIndex{
    return [self.imperials objectAtIndex:anIndex];
}



@end
