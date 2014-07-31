//
//  boorpaDetailRestaurantViewController.h
//  Boorpa
//
//  Created by Arie Prasetyo on 5/8/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface boorpaDetailRestaurantViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *detail_restaurant;
    UITableView *review;
    UITableView *menu;
    
    UIImageView *_headerImage;
    UIImageView *test_image;
    
    UIView  *top_wrapper;
    UIView *review_wrapper;
    UIView *description;
    
    UILabel *resto_name;
    UILabel *location_summary;
    
    UILabel *about_title;
    UILabel *about_content;
    UILabel *maps;
    
    UISegmentedControl *segmentSelector;
    UIScrollView *scroll;
}
@end
