//
//  CardGameViewController.m
//  MatchGame
//
//  Created by Matt Birmingham on 6/24/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
//#import "Deck.h"

@interface CardGameViewController ()
@property (strong,nonatomic) PlayingCardDeck *deck;

@end

@implementation CardGameViewController

/*
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

- (PlayingCardDeck *)deck {
    if(!_deck) _deck = [[PlayingCardDeck alloc]init];
    return _deck;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *nextCard = [self.deck drawRandomCard];
        if(nextCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
            [sender setTitle:nextCard.contents forState:UIControlStateNormal];
        }
    }
}

@end
