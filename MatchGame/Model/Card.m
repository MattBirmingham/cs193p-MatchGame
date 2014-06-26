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
    NSString *reason = @"";
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score=1;
            
            reason = [NSString stringWithFormat:@"%@ %@ %@ matched!",reason, card.contents, self.contents];
        } else {
            reason = [NSString stringWithFormat:@"%@ %@ %@ don't match!", reason, card.contents, self.contents];
        }

    }
    
    self.matchReason = reason;
    return score;
}

@end
