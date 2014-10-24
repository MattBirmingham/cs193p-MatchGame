//
//  SetCard.h
//  MatchGame
//
//  Created by Matt Birmingham on 7/15/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger rank;
@property (strong,nonatomic) NSString *symbol;
@property (strong,nonatomic) NSString *shade;
@property (strong,nonatomic) NSString *color;

+ (NSArray *)validSymbols;
+ (NSUInteger)maxRank;
+ (NSArray *)validShades;
+ (NSArray *)validColors;

@end
