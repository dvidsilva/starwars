//
//  DVDCharacterModel.h
//  StarWars
//
//  Created by Dvid Silva on 5/6/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVDCharacterModel : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSURL *wikiPage;
@property (strong, nonatomic) NSData *soundData;
@property (strong, nonatomic) UIImage *photo;

#pragma mark -  Metodos de Clase
+(id)characterModelWithFirstName:(NSString*) aFirstName
                        lastName:(NSString *) aLastName
                           alias: (NSString *) anAlias
                        wikiPage: (NSURL *) aWikiPage
                       soundData: (NSData *) aSoundData
                           photo: (UIImage *) aPhoto;

+(id)characterModelWithAlias: (NSString *) anAlias
                    wikiPage: (NSURL *) aWikiPage
                   soundData: (NSData *) aSoundData
                       photo: (UIImage *) aPhoto;



#pragma mark -  Designados
-(id)initWithFirstName:(NSString*) aFirstName
              lastName:(NSString *) aLastName
                 alias: (NSString *) anAlias
              wikiPage: (NSURL *) aWikiPage
             soundData: (NSData *) aSoundData
                 photo: (UIImage *) aPhoto;


-(id)initWithAlias: (NSString *) anAlias
          wikiPage: (NSURL *) aWikiPage
         soundData: (NSData *) aSoundData
             photo: (UIImage *) aPhoto;


@end
