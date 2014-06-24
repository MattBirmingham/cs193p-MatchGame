//
//  PlayingCard.m
//  Matchismo
//
//  Created by Matt Birmingham on 6/22/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// Setters & Getters
@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit {
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
- (NSString *)suit {
    //return (test) ? true : false;
    return _suit ? _suit : @"?";
}
- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

// End Setters & Getters


- (NSString *)contents {
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    //return [NSString stringWithFormat:@"%@%@", [rankStrings objectAtIndex:self.rank], self.suit];
}

// This is a class method. Must be referred to as [PlayingCard validSuits]
// Class method Identified by the +

+ (NSArray *)validSuits{
    return @[@"♣️",@"♠️",@"♥️",@"♦️"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count]-1;
}


@end
