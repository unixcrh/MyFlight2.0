//
//  FrequentMainPageCell.m
//  MyFlight2.0
//
//  Created by Davidsph on 1/13/13.
//  Copyright (c) 2013 LIAN YOU. All rights reserved.
//

#import "FrequentMainPageCell.h"

@implementation FrequentMainPageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_thisImageView release];
    [_thisNameLabel release];
    [super dealloc];
}
@end
