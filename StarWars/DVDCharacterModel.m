//
//  DVDCharacterModel.m
//  StarWars
//
//  Created by Dvid Silva on 5/6/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDCharacterModel.h"

@implementation DVDCharacterModel


+(id)characterModelWithFirstName:(NSString*) aFirstName
                        lastName:(NSString *) aLastName
                           alias: (NSString *) anAlias
                        wikiPage: (NSURL *) aWikiPage
                       soundData: (NSData *) aSoundData
                           photo: (UIImage *) aPhoto{
    return [[self alloc] initWithFirstName:aFirstName
                                  lastName:aLastName
                                     alias:anAlias
                                  wikiPage:aWikiPage
                                 soundData:aSoundData
                                     photo:aPhoto];
}

+(id)characterModelWithAlias: (NSString *) anAlias
                    wikiPage: (NSURL *) aWikiPage
                   soundData: (NSData *) aSoundData
                       photo: (UIImage *) aPhoto{
    return [[self alloc] initWithAlias:anAlias
                              wikiPage:aWikiPage
                             soundData:aSoundData
                                 photo:aPhoto];
}




-(id)initWithFirstName:(NSString*) aFirstName
              lastName:(NSString *) aLastName
                 alias: (NSString *) anAlias
              wikiPage: (NSURL *) aWikiPage
             soundData: (NSData *) aSoundData
                 photo: (UIImage *) aPhoto{
    
    if(self = [super init]){
        _firstName = aFirstName;
        _lastName = aLastName;
        _alias = anAlias;
        _wikiPage = aWikiPage;
        _soundData = aSoundData;
        _photo = aPhoto;
    }
    return self;
}


-(id)initWithAlias: (NSString *) anAlias
          wikiPage: (NSURL *) aWikiPage
         soundData: (NSData *) aSoundData
             photo: (UIImage *) aPhoto{
    
    return [self initWithFirstName: @""
                          lastName: @""
                             alias: anAlias
                          wikiPage: aWikiPage
                         soundData: aSoundData
                             photo: aPhoto ];
}

@end
