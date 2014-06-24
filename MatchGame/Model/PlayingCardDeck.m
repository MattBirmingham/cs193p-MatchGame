//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Matt Birmingham on 6/22/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits])
            for (NSUInteger rank=1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *newCard = [[PlayingCard alloc]init];
                
                newCard.rank=rank; newCard.suit=suit;
                [self addCard:newCard];

            }
        
    }
    
    return self;
}

@end
