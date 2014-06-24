//
//  Card.m
//  Matchismo
//
//  Created by Matt Birmingham on 6/22/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score=1;
        }

    }
    
    return score;
}

@end
