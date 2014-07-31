//
//  boorpaRightViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 4/30/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaRightViewController.h"
#import "boorpaLeftMenuTableViewCell.h"
@interface boorpaRightViewController ()

@end

@implementation boorpaRightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        list_menu = @[@"HOME", @"UPGRADE", @"VERIFIKASI",@"KEANGGOTAAN", @"EDIT PROFILE", @"LOGOUT"];
        page = @[@"boorpaRestoListViewController", @"boorpaCardViewController", @"boorpaCheckInViewController",@"boorpaListOrderViewController", @"boorpaOrderHistoryViewController", @"boorpaSettingViewController"];
        self.view.backgroundColor=[UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1];
        table_menu = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
        table_menu.separatorColor = [UIColor clearColor];
        table_menu.delegate = self;
        table_menu.dataSource =self;
        table_menu.backgroundColor = [UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1];
        [self.view addSubview:table_menu];
        
        UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 130)];
        
        UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake(170-70, 10, 80, 80)];
        avatar.image=[UIImage imageNamed:@"thumbs_fr_0062.jpg"];
        avatar.layer.cornerRadius = 40;
        avatar.layer.masksToBounds = YES;
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 270, 30)];
        name.textAlignment = NSTextAlignmentCenter;
        name.backgroundColor = [UIColor colorWithRed:0.098 green:0.357 blue:0.282 alpha:1];
        name.font =  [UIFont fontWithName:fontDefault size:14];
        name.textColor = [UIColor whiteColor];
        name.text = @"{{User Nama}}";
        
        [headerview addSubview:name];
        [headerview addSubview:avatar];
        headerview.backgroundColor = [UIColor clearColor];
        table_menu.tableHeaderView = headerview;
    }
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return list_menu.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier =@"cell";
    boorpaLeftMenuTableViewCell *cell = [table_menu dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell = [[boorpaLeftMenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.menu_title.text = [list_menu objectAtIndex:indexPath.row];
    [cell.icon setImage:[UIImage imageNamed:[[list_menu objectAtIndex:indexPath.row] lowercaseString]]];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [boorpa setCenter:[page objectAtIndex:indexPath.row]];
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
