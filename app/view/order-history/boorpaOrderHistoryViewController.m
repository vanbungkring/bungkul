//
//  boorpaOrderHistoryViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/24/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaOrderHistoryViewController.h"

@interface boorpaOrderHistoryViewController ()

@end

@implementation boorpaOrderHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"Order History";
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        // Add your action to your button
        [customButton addTarget:self action:@selector(barButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
        // Customize your button as you want, with an image if you have a pictogram to display for example
        [customButton setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
        
        // Then create and add our custom BBBadgeBarButtonItem
        BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];
        // Set a value for the badge
        barButton.badgeValue = @"2";
        
        barButton.badgeOriginX = 13;
        barButton.badgeOriginY = -9;
        
        // Add it as the leftBarButtonItem of the navigation bar
        self.navigationItem.rightBarButtonItem = barButton;
    }
    return self;
}
-(void)barButtonItemPressed:(id)sender{
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
