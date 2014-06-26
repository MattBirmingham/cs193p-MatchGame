//
//  CardMatchingGame.h
//  MatchGame
//
//  Created by Matt Birmingham on 6/24/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//DESIGNATED INITIALIZER
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
