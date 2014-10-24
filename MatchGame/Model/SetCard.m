//
//  SetCard.m
//  MatchGame
//
//  Created by Matt Birmingham on 7/15/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#pragma mark - Header
#import "SetCard.h"

@implementation SetCard

#pragma mark - Attributes
// Setters & Getters
@synthesize symbol = _symbol;

- (void)setSymbol:(NSString *)symbol {
    if([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (NSString *)symbol {
    return _symbol ? _symbol : @"?";
}


- (void)setRank:(NSUInteger)rank {
    if (rank <= [SetCard maxRank]) {
        _rank = rank;
    }
}

@synthesize shade = _shade;

- (void)setShade:(NSString *)shade {
    if ([[SetCard validShades] containsObject:shade]) {
        _shade = shade;
    }
}

- (NSString *)shade {
    return _shade ? _shade : @"?";
}

@synthesize color = _color;

- (void)setColor:(NSString *)color {
    if([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

- (NSString *)color {
    return _color ? _color : @"?";
}

// End Setters & Getters

#pragma mark - Methods
- (NSString *)contents {
    return nil;
}

// This is a class method. Must be referred to as [PlayingCard validSuits]
// Class method Identified by the +

+ (NSArray *)validSymbols{
    return @[@"A",@"B",@"C"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"1",@"2",@"3"];
}

+ (NSArray *)validShades{
    return @[@"solid",@"striped",@"open"];
}

+ (NSArray *)validColors{
    return @[@"light",@"medium",@"dark"];
}

+ (NSUInteger)maxRank {
    return [[SetCard rankStrings] count]-1;
}


- (int)match:(NSArray *)otherCards {
    int score = 0;
    bool doesMatch = false;
    NSString *reason = @"";
    
    if([otherCards count]==2) {
        // Only perform the match algorithm on 3 cards
        if([self rankDoesMatch:otherCards[0] secondCard:otherCards[1]] &&
           [self symbolDoesMatch:otherCards[0] secondCard:otherCards[1]] &&
           [self shadeDoesMatch:otherCards[0] secondCard:otherCards[1]] &&
           [self colorDoesMatch:otherCards[0] secondCard:otherCards[1]])
            doesMatch = true;
    }
    
/*
    for (PlayingCard *card in otherCards) {
        if (card.rank == self.rank) {
            score = 4;
            reason = [NSString stringWithFormat:@"%@ %@ %@ matched!", reason, self.contents, card.contents];
        } else if ([card.suit isEqualToString:self.suit]) {
            score = 1;
            reason = [NSString stringWithFormat:@"%@ %@ %@ matched!", reason, self.contents, card.contents];
        } else {
            reason = [NSString stringWithFormat:@"%@ %@ %@ didn't match!", reason, self.contents, card.contents];
            // no match
        }
    }
*/
    self.matchReason = reason;
    
    return score;
}

/*
- (BOOL)rankIsSet:(NSArray *)cards {
    BOOL isSet = false;
    
    if(
       ((self.rank == ((SetCard *)cards[0]).rank) &&
        (self.rank == ((SetCard *)cards[1]).rank) &&
        ((SetCard *)cards[0]).rank == (SetCard *)cards[0]).rank))
       ||
       ((self.rank != cardA.rank) &&
        (self.rank != cardB.rank) &&
        (cardA.rank != cardB.rank))
       )
        isSet = YES;
    
    return isSet;
}
*/

- (BOOL)rankDoesMatch:(SetCard *)cardA secondCard:(SetCard *)cardB {
    BOOL doesMatch = false;
    
    if(
        ((self.rank == cardA.rank) &&
         (self.rank == cardB.rank) &&
         (cardA.rank == cardB.rank))
       ||
        ((self.rank != cardA.rank) &&
         (self.rank != cardB.rank) &&
         (cardA.rank != cardB.rank))
       )
        doesMatch = YES;
    
    return doesMatch;
}

- (BOOL)symbolDoesMatch:(SetCard *)cardA secondCard:(SetCard *)cardB {
    BOOL doesMatch = false;
    
    if(
       ((self.symbol == cardA.symbol) &&
        (self.symbol == cardB.symbol) &&
        (cardA.symbol == cardB.symbol))
       ||
       ((self.symbol != cardA.symbol) &&
        (self.symbol != cardB.symbol) &&
        (cardA.symbol != cardB.symbol))
       )
        doesMatch = YES;
    
    return doesMatch;

}

- (BOOL)shadeDoesMatch:(SetCard *)cardA secondCard:(SetCard *)cardB {
    BOOL doesMatch = false;
    
    if(
       ((self.shade == cardA.shade) &&
        (self.shade == cardB.shade) &&
        (cardA.shade == cardB.shade))
       ||
       ((self.shade != cardA.shade) &&
        (self.shade != cardB.shade) &&
        (cardA.shade != cardB.shade))
       )
        doesMatch = YES;
    
    return doesMatch;
}

- (BOOL)colorDoesMatch:(SetCard *)cardA secondCard:(SetCard *)cardB {
    BOOL doesMatch = false;
    
    if(
       ((self.color == cardA.color) &&
        (self.color == cardB.color) &&
        (cardA.color == cardB.color))
       ||
       ((self.color != cardA.color) &&
        (self.color != cardB.color) &&
        (cardA.color != cardB.color))
       )
        doesMatch = YES;
    
    return doesMatch;
}





@end
