//
//  boorpaCartTableViewCell.m
//  Boorpa
//
//  Created by Arie Prasetyo on 5/13/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaCartTableViewCell.h"

@implementation boorpaCartTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
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
