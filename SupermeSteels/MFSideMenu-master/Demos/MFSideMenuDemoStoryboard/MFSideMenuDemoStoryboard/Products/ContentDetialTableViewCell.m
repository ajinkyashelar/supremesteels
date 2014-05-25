//
//  ContentDetialTableViewCell.m
//  MFSideMenuDemoStoryboard
//
//  Created by Saint-Gobain Indec on 02/05/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import "ContentDetialTableViewCell.h"

@implementation ContentDetialTableViewCell
@synthesize attributeLable, valueLable;
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
