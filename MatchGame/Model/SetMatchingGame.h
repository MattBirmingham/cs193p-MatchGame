//
//  SetMatchingGame.h
//  MatchGame
//
//  Created by Matt Birmingham on 7/16/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"
#import "SetCardDeck.h"

@interface SetMatchingGame : NSObject

//DESIGNATED INITIALIZER
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(SetCardDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (SetCard *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;
@property (strong,nonatomic,readonly) NSString *scoreReason;


@end
