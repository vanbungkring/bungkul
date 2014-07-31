//
//  boorpaRightViewController.h
//  Boorpa
//
//  Created by Arie Prasetyo on 4/30/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface boorpaRightViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table_menu;
    NSArray *list_menu;
    NSArray *page;
}


@end
