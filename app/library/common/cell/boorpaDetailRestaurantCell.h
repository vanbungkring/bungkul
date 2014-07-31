//
//  boorpaDetailRestaurantCell.h
//  Boorpa
//
//  Created by Arie Prasetyo on 5/9/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface boorpaDetailRestaurantCell : UITableViewCell
@property (retain, nonatomic)  UIImageView *parallaxImage;
@property (retain, nonatomic)  UILabel *titleLabel;
@property (retain, nonatomic)  UILabel *subtitleLabel;
- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;
@end
