//
//  ViewController.h
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSCodingChallengeViewController : UIViewController

/**
 *   Image view to display object's image.
 */
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

/**
 *   Will animate when object's image is on loading state.
 */
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

/**
 *   By clicking this button user can pick an object, and the object's data wil be shown on this view controller
 */
@property (nonatomic, strong) IBOutlet UIButton *pickObjectButton;

/**
 *   User can use this button to set the object as favorite.
 */
@property (nonatomic, strong) IBOutlet UIButton *markAsFavoriteButton;

/**
 *   If any error occured, or no more object left to pick, the information will be shown here.
 */
@property (nonatomic, strong) IBOutlet UILabel *errorInfo;

/**
 *   Object's data (if there) will display here.
 */
@property (nonatomic, strong) IBOutlet UILabel *dataInfo;

/**
 *   This label will display user's name and country.
 */
@property (nonatomic, strong) IBOutlet UILabel *userInfo;

/**
 *   This label will display object's creation info, e.g. "Created 2 days ago", “Created just now” etc.
 */
@property (nonatomic, strong) IBOutlet UILabel *creationInfo;

/**
 *   Action method of pickObjectButton button.
 */
- (IBAction)pickObject:(id)sender;

/**
 *   Action method of markAsFavoriteButton button.
 */
- (IBAction)markAsFavorite:(id)sender;

/**
 *   Action method of right bar button "Favorites".
 */
- (IBAction)displayFavorites:(id)sender;

@end

