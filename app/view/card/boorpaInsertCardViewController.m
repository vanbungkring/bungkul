//
//  boorpaInsertCardViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/8/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaInsertCardViewController.h"

@interface boorpaInsertCardViewController ()

@end

@implementation boorpaInsertCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor lightGrayColor];
       
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 40)];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont fontWithName:fontDefault size:18];
        title.textColor = [UIColor darkGrayColor];
        title.text = @"Add New Card";
        
        UIButton *close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        close.frame = CGRectMake(100, 0, 100, 40);
        [close setTitle:@"Close" forState:UIControlStateNormal];
        [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [close setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        
        [self.view addSubview:title];
        self.view.frame = CGRectMake(0, 0, 280, 380);
        // If you want your BarButtonItem to handle touch event and click, use a UIButton as customView
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
    
}- (void)close{
    [self dismissViewControllerAnimated:YES completion:^{
       // code
    }];
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [boorpa setLeftOff];
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
