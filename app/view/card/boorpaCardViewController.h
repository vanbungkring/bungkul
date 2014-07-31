//
//  boorpaCardViewController.h
//  Boorpa
//
//  Created by Arie Prasetyo on 5/7/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "boorpaInsertCardViewController.h"
@interface boorpaCardViewController : UIViewController
{
    UITableView *table_card;
    boorpaInsertCardViewController *popup;
}
@end
