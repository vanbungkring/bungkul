//
//  boorpaDetailRestaurantViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/8/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaDetailRestaurantViewController.h"
#import "boorpaDetailRestaurantCell.h"
@interface boorpaDetailRestaurantViewController ()

@end
static CGFloat kImageOriginHight = 200.f;
@implementation boorpaDetailRestaurantViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        
        detail_restaurant =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
        detail_restaurant.delegate = self;
        detail_restaurant.tag =1;
        detail_restaurant.dataSource = self;
        
        menu =[[UITableView alloc]initWithFrame:CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
        menu.delegate = self;
        menu.separatorColor = [UIColor clearColor];
        menu.tag =2;
        menu.dataSource = self;
        
        review=[[UITableView alloc]initWithFrame:CGRectMake(320*2, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
        review.delegate = self;
        review.tag =3;
        review.dataSource = self;
        
        
        scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
        scroll.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
        scroll.pagingEnabled = YES;
        self.automaticallyAdjustsScrollViewInsets = NO;
        scroll.userInteractionEnabled =true;
        scroll.delegate = self;
        scroll.tag=1;
        
        _headerImage = [[UIImageView alloc]init];
        _headerImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 240);
		_headerImage.layer.masksToBounds = YES;
        _headerImage.image =[UIImage imageNamed:@"thumbs_fr_0062.jpg"];
        _headerImage.contentMode = UIViewContentModeScaleAspectFill;
        
        resto_name = [[UILabel alloc]initWithFrame:CGRectMake(10, 240-70, 300, 30)];
        resto_name.font = [UIFont fontWithName:fontDefault size:25];
        resto_name.textColor = [UIColor whiteColor];
        resto_name.text = @"Boorpa Resto";
        
        
        location_summary =[[UILabel alloc]initWithFrame:CGRectMake(10, 240-50, 300, 30)];
        location_summary.font = [UIFont fontWithName:fontDefault size:16];
        location_summary.textColor = [UIColor whiteColor];
        location_summary.text = @"Mampang Prapatan, Jakarta";
        
        about_title =[[UILabel alloc]initWithFrame:CGRectMake(30, 10, 300, 20)];
        about_title.font = [UIFont fontWithName:fontDefault size:16];
        about_title.textColor = [UIColor darkGrayColor];
        about_title.text = @"About";
        
        about_content =[[UILabel alloc]initWithFrame:CGRectMake(30, 30, 280, 20)];
        about_content.font = [UIFont fontWithName:fontDefault size:14];
        about_content.textColor = [UIColor lightGrayColor];
        about_content.text = @"Youve found it. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets. The Avengers return. Earths Mightiest Heroes reunite with their biggest guns at the forefront to take on familiar enemies and new threats alike.";
        [about_content setNumberOfLines:6];
        [about_content sizeToFit];
        
        maps =[[UILabel alloc]initWithFrame:CGRectMake(30, 10, 300, 20)];
        maps.font = [UIFont fontWithName:fontDefault size:16];
        maps.textColor = [UIColor darkGrayColor];
        maps.text = @"Maps";
        
        //747474
        top_wrapper = [[UIView alloc]initWithFrame:_headerImage.frame];
        [top_wrapper addSubview:_headerImage];
        [top_wrapper addSubview:resto_name];
        [top_wrapper addSubview:location_summary];
        
        NSArray *item = @[@"About",@"Menu"];
        segmentSelector = [[UISegmentedControl alloc] initWithItems:item];
        [segmentSelector setSelectedSegmentIndex:0];
        segmentSelector.momentary = NO;
        [[self navigationItem] setTitleView:segmentSelector];
        [segmentSelector addTarget:self action:@selector(actionSegmentedIndexChanged:) forControlEvents:UIControlEventValueChanged];
        
        [scroll addSubview:detail_restaurant];
        [scroll addSubview:menu];
        [scroll addSubview:review];
        [self.view addSubview:scroll];
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
- (void) actionSegmentedIndexChanged:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    [segmentedControl setSelectedSegmentIndex:[segmentedControl selectedSegmentIndex]];
    [scroll scrollRectToVisible:CGRectMake([segmentedControl selectedSegmentIndex]*320, 0, self.view.frame.size.width, self.view.frame.size.height) animated:YES];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (tableView.tag) {
        case 1:
            return 4;
            break;
            
        case 2:
            return 4;
            break;
            
        default:
            return 10;
            break;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag==1){
        static NSString *cellIdentifier =@"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.row) {
            case 0:
                [cell.contentView addSubview:top_wrapper];
                break;
                
            case 1:
                cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"review"]];
                break;
            case 2:
                [cell.contentView addSubview:about_title];
                [cell.contentView addSubview:about_content];
                break;
            case 3:
                [cell.contentView addSubview:maps];
                break;
                
        }
        return cell;
    }
    else if(tableView.tag==2){
        static NSString *cellIdentifier =@"cell";
        boorpaDetailRestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil){
            cell = [[boorpaDetailRestaurantCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        [cell.parallaxImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"demo_%d.jpg",indexPath.row+1]]];
        return cell;
    }
    else{
        static NSString *cellIdentifier =@"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text =@"Review";
        return cell;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [boorpa setLeftOff];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView ==scroll){
        if(scrollView.contentOffset.x==320){
            [segmentSelector setSelectedSegmentIndex:1];
        }
        else if(scrollView.contentOffset.x==0){
            [segmentSelector setSelectedSegmentIndex:0];
        }
    }
    if(scrollView == menu) {
        // its your tableView
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag==1){
        switch (indexPath.row) {
            case 0:
                return 240;
                break;
            case 2:
                return 160;
                break;
            case 1:
                return 60;
                break;
            case 3:
                return 284;
                break;
                
            default:
                return 36;
                break;
        }
        return 155*0.5;
    }
    else if(tableView.tag==2){
        return 150;
    }
    else{
        return 44;
    }
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
