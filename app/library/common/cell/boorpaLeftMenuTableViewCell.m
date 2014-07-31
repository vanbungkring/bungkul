//
//  boorpaLeftMenuTableViewCell.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/7/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaLeftMenuTableViewCell.h"

@implementation boorpaLeftMenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 27.5, 27.5)];
		self.icon.layer.masksToBounds = YES;
		self.icon.layer.cornerRadius = 5;
		self.icon.image = [UIImage imageNamed:@"location"];
		
		self.menu_title = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 200, 20)];
		self.menu_title.font = [UIFont fontWithName:fontDefault size:15];
		self.menu_title.textColor =[UIColor whiteColor];

        [self.contentView addSubview:self.icon];
		[self.contentView addSubview:self.menu_title];

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
