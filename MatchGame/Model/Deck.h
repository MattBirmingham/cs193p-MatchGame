//
//  Deck.h
//  Matchismo
//
//  Created by Matt Birmingham on 6/22/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
