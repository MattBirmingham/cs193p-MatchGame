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
@property (strong,nonatomic, readwrite) NSString *scoreReason;
@property (nonatomic) NSUInteger matchCount;
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSMutableArray *)cards {
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
                     cardsToMatch:(NSUInteger)matchCount {
    self = [super init];
    
    if(self)    {
        //set the game match count
        self.matchCount =  (matchCount > 1) ? matchCount : 2;
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
    BOOL clearSelections = NO;
    BOOL matchSelections = NO;
    
    if(!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //try to find any other matching cards
            /* THis is the 1 card match game
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]]; //only 1 card in the array so far
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO; // this is only working for 2 cards
                    }
                    break; // can only choose 2 cards
                }
            
            }
            */
             //Find all of the chosen, unmatched cards:
            NSMutableArray *selectedCards = [[NSMutableArray alloc]init];
            for (Card *selectedCard in self.cards) {
                if (selectedCard.isChosen && !selectedCard.isMatched) {
                    [selectedCards addObject:selectedCard];
                }
            }
            
            NSLog(@"Game: %d, Selected cards: %d",self.matchCount, [selectedCards count]);
            // if selected card count < game type, keep selecting
            // if selected card count > game type, close all of the matched cards
            // if selected card count == game type, run match algorithm
            if ([selectedCards count]+1 > self.matchCount) {
                clearSelections = YES;
            } else if ([selectedCards count]+1 == self.matchCount) {
                int matchScore = [card match:selectedCards];
                if (matchScore) {
                    matchSelections = YES;
                    card.matched = YES;
                    self.score += matchScore * MATCH_BONUS;
                } else {
                    self.score -= MISMATCH_PENALTY;
                }
            }
            
            if(clearSelections || matchSelections) {
                for (Card *selectedCard in selectedCards) {
                    selectedCard.chosen = !clearSelections;
                    selectedCard.matched = matchSelections;
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
        self.scoreReason = card.matchReason;
    }
    
    
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

@end
