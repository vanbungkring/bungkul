//
//  boorpaCheckInViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/7/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaCheckInViewController.h"
#import "boorpaQRScannerViewController.h"
@interface boorpaCheckInViewController ()

@end

@implementation boorpaCheckInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Check In";
        label_check_in = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-240, 320, 24)];
        label_check_in.font = [UIFont fontWithName:fontDefault size:21];
        label_check_in.textColor = [UIColor darkGrayColor];
        label_check_in.textAlignment = NSTextAlignmentCenter;
        label_check_in.text = @"Check In";
        
        label_check_in_content= [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-210, 280, 24)];
        label_check_in_content.font = [UIFont fontWithName:fontDefault size:15];
        label_check_in_content.textColor = [UIColor lightGrayColor];
        label_check_in_content.textAlignment = NSTextAlignmentCenter;
        label_check_in_content.text = @"This is where youll find all the big-time action, major storylines and iconic Spider-Man magic youd come to expect from the Wall-Crawler";
        label_check_in_content.numberOfLines = 4;
        [label_check_in_content sizeToFit];
        
        checkin_button = [UIButton buttonWithType:UIButtonTypeCustom];
        checkin_button.frame = CGRectMake(22.5,self.view.frame.size.height-100, 275, 47);
        [checkin_button setBackgroundImage:[UIImage imageNamed:@"checkin"] forState:UIControlStateNormal];
        [checkin_button addTarget:self action:@selector(scanBarcode:) forControlEvents:UIControlEventTouchUpInside];
        
        checkin = [[UIImageView alloc]init];
        checkin.frame =CGRectMake(100, self.view.frame.size.height-380, 120, 120);
        checkin.image =[UIImage imageNamed:@"checkin_badge"];
        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                          target:self action:nil];
        self.navigationController.navigationItem.rightBarButtonItem = refreshButton;
        [self.view addSubview:checkin];
        [self.view addSubview:label_check_in];
        [self.view addSubview:label_check_in_content];
        [self.view addSubview:checkin_button];
        self.view.backgroundColor = [UIColor whiteColor];
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
    
}
-(void)scanBarcode:(id)sender{
    boorpaQRScannerViewController *scan =[[boorpaQRScannerViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:scan];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
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
