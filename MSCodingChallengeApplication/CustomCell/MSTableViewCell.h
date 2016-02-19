//
//  MSTableViewCell.h
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/20/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *userInfo;
@property (nonatomic, strong) IBOutlet UILabel *creationInfo;
@property (nonatomic, strong) IBOutlet UIImageView *objectImage;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
;
@end
