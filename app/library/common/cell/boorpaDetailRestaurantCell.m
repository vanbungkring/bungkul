//
//  boorpaDetailRestaurantCell.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/9/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaDetailRestaurantCell.h"

@implementation boorpaDetailRestaurantCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.parallaxImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)];
        self.parallaxImage.layer.masksToBounds =NO;
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 300, 30)];
        self.titleLabel.font = [UIFont fontWithName:fontDefault size:25];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.text = @"Alacarte";
        
        self.subtitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 300, 18)];
        self.subtitleLabel.font = [UIFont fontWithName:fontDefault size:14];
        self.subtitleLabel.textColor = [UIColor whiteColor];
        self.subtitleLabel.text = @"iRate did not prompt for rating because";
        
        
        [self.contentView addSubview:self.parallaxImage];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subtitleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
   
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.parallaxImage.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.parallaxImage.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.parallaxImage.frame = imageRect;
}

@end
