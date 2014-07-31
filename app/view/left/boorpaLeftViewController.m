//
//  boorpaLeftViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 4/30/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaLeftViewController.h"
#import "boorpaLeftMenuTableViewCell.h"
@interface boorpaLeftViewController ()

@end

@implementation boorpaLeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1];
        table_menu = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 270, self.view.frame.size.height-20)];
        table_menu.delegate = self;
        table_menu.contentInset =UIEdgeInsetsZero;
        table_menu.dataSource = self;
        table_menu.backgroundColor = [UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1];
        total_menu = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 140, 44)];
        total_menu.font = [UIFont fontWithName:fontDefault size:18];
        total_menu.textAlignment = NSTextAlignmentCenter;
        total_menu.textColor = [UIColor whiteColor];
        total_menu.text = @"Rp 120.000";
        [self.view addSubview:table_menu];
    }
    return self;
}

///deleting menu
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
     return UITableViewCellEditingStyleDelete;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 44)];
    /* Create custom view to display section header... */
    view.backgroundColor = [UIColor colorWithRed:0.098 green:0.357 blue:0.282 alpha:1]; //your background color...
    
    UIView *left_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 140, 44)];
    left_view.backgroundColor =[UIColor redColor];
    [view addSubview:left_view];
    [left_view addSubview:total_menu];
    
    
    UIView *right_view = [[UIView alloc]initWithFrame:CGRectMake(140, 0, 140, 44)];
    right_view.backgroundColor =[UIColor yellowColor];
    [view addSubview:right_view];
    
    
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 44)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 260, 18)];
    [label setFont:[UIFont fontWithName:fontDefault size:14]];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    NSString *string =@"Shopping Chart";
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    view.backgroundColor = [UIColor blackColor]; //your background color...
    return view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier =@"cell";
    boorpaLeftMenuTableViewCell *cell = [table_menu dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell = [[boorpaLeftMenuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.menu_title.text =@"Data";
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[boorpa setCenter:[page objectAtIndex:indexPath.row]];
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

@end
