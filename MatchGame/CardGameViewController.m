//
//  CardGameViewController.m
//  MatchGame
//
//  Created by Matt Birmingham on 6/24/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "CardGameViewController.h"
//#import "PlayingCardDeck.h"
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

// This is an abstract method. Must be implemented.
- (Deck *)createDeck {
    return nil; // [[PlayingCardDeck alloc]init];
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


- (void)confirmDealSheet:(UIActionSheet *)confirmDealSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Handle the user's choice of content mode for the profile image.
    self.game = nil;
    self.gameSegment.enabled = YES;
    [self updateUI];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            self.game = nil;
            self.gameSegment.enabled = YES;
            [self updateUI];
            break;
            
        default:
            break;
    }
    
}


- (IBAction)touchDealButton:(UIButton *)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Would you like to stop this game and re-deal?"
                                                       message:nil
                                                      delegate:self
                                             cancelButtonTitle:@"Redeal"
                                             otherButtonTitles:@"Continue Game", nil];
    
    [alertView show];

    /*
    UIActionSheet *confirmDealSheet = [[UIActionSheet alloc]initWithTitle:@"Confirm Re-deal"
                                                                 delegate:self
                                                        cancelButtonTitle:@"cancel"
                                                   destructiveButtonTitle:@"Destruct"
                                                        otherButtonTitles:nil];
    
    [confirmDealSheet showInView:self.view];
    */
    

}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    self.gameSegment.enabled = NO;
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

@end
