//
//  CardGameViewController.h
//  MatchGame
//
//  Created by Matt Birmingham on 6/24/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// This is an abstract method. Must be implemented.
- (Deck *)createDeck;

@end
