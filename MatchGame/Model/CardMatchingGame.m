//
//  CardMatchingGame.m
//  MatchGame
//
//  Created by Matt Birmingham on 6/24/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
/// This is called the "Class Extensions"
@property (strong,nonatomic) NSMutableArray *cards; //array of Cards
@property (nonatomic, readwrite) NSInteger score;
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSMutableArray *)cards {
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if(self)    {
        //Now, choose a random number(count) of cards from the provided deck
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if(card) {
                [self.cards addObject:card];
            } else {
                // this is bad. This means count>deck size :(
                self = nil;
                break;
            }
        }
    }
    
    
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // try to find any other matching cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]]; //only 1 card in the array so far
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; // can only choose 2 cards
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
    }
    
    
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

@end
