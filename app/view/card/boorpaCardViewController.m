//
//  boorpaCardViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/7/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaCardViewController.h"
#import "UIViewController+MaryPopin.h"
@interface boorpaCardViewController ()
@property (nonatomic, getter = isDismissable) BOOL dismissable;
@end

@implementation boorpaCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        table_card = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        popup = [[boorpaInsertCardViewController alloc]init];
        [self.view addSubview:table_card];
        
        self.title = @"Manage Cards";
//        // If you want your BarButtonItem to handle touch event and click, use a UIButton as customView
//        UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//        // Add your action to your button
//        [customButton addTarget:self action:@selector(barButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
//        // Customize your button as you want, with an image if you have a pictogram to display for example
//        [customButton setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
//        
//        // Then create and add our custom BBBadgeBarButtonItem
//        BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];
//        // Set a value for the badge
//        barButton.badgeValue = @"2";
//        
//        barButton.badgeOriginX = 13;
//        barButton.badgeOriginY = -9;
//        
//        // Add it as the leftBarButtonItem of the navigation bar
//        self.navigationItem.rightBarButtonItem = barButton;
    }
    return self;
}
-(void)barButtonItemPressed:(id)sender{
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [boorpa setLeftOn];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Add Card" style:UIBarButtonItemStylePlain target:self action:@selector(addCard:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    // Do any additional setup after loading the view.
}
-(void)addCard:(id)sender{
    [self setDismissable:false];
    [popup setPopinOptions:BKTPopinDisableAutoDismiss];
    [popup setPopinTransitionStyle:5];
    [popup setPopinOptions:[popup popinOptions]|BKTPopinBlurryDimmingView];
    [popup setPreferedPopinContentSize:CGSizeMake(280.0, 300.0)];
    [self.navigationController presentPopinController:popup animated:YES completion:^{
        
    }];

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
