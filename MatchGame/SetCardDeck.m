//
//  SetCardDeck.m
//  MatchGame
//
//  Created by Matt Birmingham on 7/15/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
         for (NSString *symbol in [SetCard validSymbols])
             for (NSString *shade in [SetCard validShades])
                 for (NSString *color in [SetCard validColors])
                     for (NSUInteger rank=1; rank <= [SetCard maxRank]; rank++) {
                         SetCard *newCard = [[SetCard alloc]init];
         
                         newCard.symbol = symbol;
                         newCard.shade = shade;
                         newCard.color = color;
                         newCard.rank = rank;
                     }
         
    }
    
    return self;
}

@end
