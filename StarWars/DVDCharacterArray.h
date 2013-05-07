//
//  DVDCharacterArray.h
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVDCharacterModel.h"
@interface DVDCharacterArray : NSObject

@property (nonatomic, readonly) int rebelCount;
@property (nonatomic, readonly) int imperialCount;

-(DVDCharacterModel *) rebelCharacterAtIndex: (int) anIndex;
-(DVDCharacterModel *) imperialCharacterAtIndex: (int) anIndex;


@end
