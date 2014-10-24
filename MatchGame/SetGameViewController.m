//
//  SetGameViewController.m
//  MatchGame
//
//  Created by Matt Birmingham on 9/7/14.
//  Copyright (c) 2014 Cubit Solutions. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

// This is an abstract method. Must be implemented.
- (SetCardDeck *)createDeck {
    return [[SetCardDeck alloc]init];
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end