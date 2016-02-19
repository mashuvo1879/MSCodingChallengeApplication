//
//  MSTableViewCell.m
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/20/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "MSTableViewCell.h"

@implementation MSTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
