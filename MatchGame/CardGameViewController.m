//
//  CardGameViewController.m
//  MatchGame
//
//  Created by Matt Birmingham on 6/24/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
//#import "Deck.h"

@interface CardGameViewController ()
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameSegment;
@property (nonatomic) int gameType;
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

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]
                                              cardsToMatch:self.gameSegment.selectedSegmentIndex+2];

    }
    return _game;
}

- (PlayingCardDeck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",[self.game score]];
        self.matchLabel.text = self.game.scoreReason;
    }
}

- (NSString *)titleForCard:(Card *)card {
    return (card.isChosen) ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card {
    return (card.isChosen) ? [UIImage imageNamed:@"cardFront"] : [UIImage imageNamed:@"cardBack"];
}

- (IBAction)changeGameSegment:(UISegmentedControl *)sender {
    self.gameType = sender.selectedSegmentIndex;
    self.game = nil;
}


- (IBAction)touchDealButton:(id)sender {
    self.game = nil;
    self.gameSegment.enabled = YES;
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    self.gameSegment.enabled = NO;
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

@end
