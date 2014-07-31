//
//  boorpaRestoListViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 4/28/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaRestoListViewController.h"
#import "boorpaDetailRestaurantViewController.h"
@interface boorpaRestoListViewController ()

@end

@implementation boorpaRestoListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        
        table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        table.delegate = self;
        table.dataSource = self;
        
        searchbar_top = [[UITextField alloc]initWithFrame:CGRectMake(42, 2, 300-44, 44)];
        searchbar_top.placeholder = @"Search Restaurant";
        searchbar_top.font = [UIFont fontWithName:fontDefault size:16];
        
        searchbar_top.delegate = self;
        
        UIView *searchbar_wrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        searchbar_wrapper.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"searchbar"]];
        [searchbar_wrapper addSubview:searchbar_top];
        
        table.tableHeaderView = searchbar_wrapper;
        
       
        
        self.title =@"Bengkel terdekat";
        [self.view addSubview:table];
        // If you want your BarButtonItem to handle touch event and click, use a UIButton as customView
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    boorpaDetailRestaurantViewController *detail = [[boorpaDetailRestaurantViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cells = @"cell";
    boorpaRestoTableViewCell *cell = [[boorpaRestoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    if(!cell){
        cell = [[boorpaRestoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
    [cell.logo setImage:[UIImage imageNamed:@"thumbs_fr_0062.jpg"]];
    return cell;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 155*0.5;
}
- (void)viewDidLoad
{
//    [super viewDidLoad];for (NSString* family in [UIFont familyNames])
//    {
//        NSLog(@"%@", family);
//        
//        for (NSString* name in [UIFont fontNamesForFamilyName: family])
//        {
//            NSLog(@"  %@", name);
//        }
//    }
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
