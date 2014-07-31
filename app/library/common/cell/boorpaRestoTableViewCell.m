//
//  boorpaRestoTableViewCell.m
//  Boorpa
//
//  Created by Arie Prasetyo on 4/30/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaRestoTableViewCell.h"

@implementation boorpaRestoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //		self.contentView.backgroundColor = []
		self.logo = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 69.5, 69.5)];
		self.logo.layer.masksToBounds = YES;
		self.logo.layer.cornerRadius = 5;
		self.logo.image = [UIImage imageNamed:@"location"];
		
		self.restoName = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 200, 20)];
		self.restoName.font = [UIFont fontWithName:fontDefault size:17];
		self.restoName.text = @"Starbucks";
		self.restoName.textColor =[UIColor blackColor];
        
		self.merchantAlamat = [[UILabel alloc]initWithFrame:CGRectMake(80, 32, 200, 18)];
		self.merchantAlamat.font = [UIFont fontWithName:fontDefault size:12];
		self.merchantAlamat.textColor =[UIColor colorWithRed:0.765 green:0.765 blue:0.765 alpha:1];
		self.merchantAlamat.text = @"Kemang Timur 2";
		
		self.merchantCategory = [[UILabel alloc]initWithFrame:CGRectMake(80, 50, 200, 18)];
		self.merchantCategory.font = [UIFont fontWithName:fontDefault size:12];
		self.merchantCategory.textColor =[UIColor colorWithRed:0.765 green:0.765 blue:0.765 alpha:1];
		
		self.my_point_wrapper = [[UIView alloc]initWithFrame:CGRectMake(255, 20, 34, 34)];
		self.my_point_wrapper.backgroundColor= [UIColor clearColor];
		self.my_point_wrapper.layer.cornerRadius = 34*0.5;
        
		self.myPoint = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, 100, 34)];
		self.myPoint.font = [UIFont fontWithName:fontDefault size:12];
		self.myPoint.textColor = [UIColor blackColor];
		self.myPoint.textAlignment = NSTextAlignmentLeft;
		self.myPoint.text = @"1.2KM";
		[self.contentView addSubview:self.logo];
		[self.contentView addSubview:self.merchantAlamat];
		[self.contentView addSubview:self.merchantCategory];
		[self.contentView addSubview:self.restoName];
		[self.contentView addSubview:self.myPoint];

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
