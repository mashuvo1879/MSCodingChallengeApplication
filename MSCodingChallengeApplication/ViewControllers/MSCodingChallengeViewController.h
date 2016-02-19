//
//  ViewController.h
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSCodingChallengeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) IBOutlet UIButton *pickObjectButton;
@property (nonatomic, strong) IBOutlet UIButton *markAsFavoriteButton;
@property (nonatomic, strong) IBOutlet UILabel *errorInfo;
@property (nonatomic, strong) IBOutlet UILabel *dataInfo;
@property (nonatomic, strong) IBOutlet UILabel *userInfo;
@property (nonatomic, strong) IBOutlet UILabel *creationInfo;

- (IBAction)pickObject:(id)sender;
- (IBAction)markAsFavorite:(id)sender;

@end

