//
//  ViewController.m
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "MSCodingChallengeViewController.h"
#import "MSFavoriteObjectViewController.h"
#import <MSCodingChallenge/MSCodingChallenge.h>
#import <MSCodingChallenge/MSObject.h>
#import <MSCodingChallenge/MSUser.h>
#import "MSUtility.h"

static NSString *const MSNoObjectLeft = @"No more object left to pick.";
static NSString *const MSErrorMsg = @"unable to load object.";
static NSString *const MSCodingChallengeViewControllerTitle = @"Objects";
static NSString *const MSPlaceholder = @"placeholder";
static NSString *const MSNoImage = @"no-image";
static NSString *const MSFavorites = @"MSFavorites";

@interface MSCodingChallengeViewController () <MSCodingChallengeDelegate>

@property (nonatomic, strong) MSCodingChallenge *codingChallenge;
@property (nonatomic, strong) MSFavoriteObjectViewController *favoriteObjectViewController;

@end

@implementation MSCodingChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = MSCodingChallengeViewControllerTitle;
    self.favoriteObjectViewController = [[MSFavoriteObjectViewController alloc] init];
    self.codingChallenge = [[MSCodingChallenge alloc] initWithDelegate: self];
    [self.codingChallenge fetchObjects];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)enablePickObjectAndFavoriteObjectButtons
{
    self.pickObjectButton.enabled = YES;
    [self.pickObjectButton setTitleColor:[UIColor colorWithRed:0.0 green:0.604 blue:0.090 alpha:1.0] forState:UIControlStateNormal];

    
    self.markAsFavoriteButton.enabled = YES;
    [self.markAsFavoriteButton setTitleColor:[UIColor colorWithRed:0.0 green:0.604 blue:0.090 alpha:1.0] forState:UIControlStateNormal];
}

- (void)disablePickObjectAndFavoriteObjectButtons
{
    self.pickObjectButton.enabled = NO;
    [self.pickObjectButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.markAsFavoriteButton.enabled = NO;
    [self.markAsFavoriteButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (void)resetObjectInfoFields
{
    self.imageView.image = [UIImage imageNamed:MSPlaceholder];
    self.dataInfo.text = @"";
    self.userInfo.text = @"";
    self.creationInfo.text = @"";
    [self disablePickObjectAndFavoriteObjectButtons];
}

- (void)loadObjectImage:(MSObject *)object
{
    self.activityIndicator.hidden = NO;
    [MSUtility imageData:[NSURL URLWithString:object.objectData] withCompletion:^(NSData *imageData, NSError *error) {
        if (error) {
            self.imageView.image = [UIImage imageNamed:MSNoImage];
        }
        else {
            self.imageView.image = [UIImage imageWithData:imageData];
        }
        
        self.activityIndicator.hidden = YES;
        [self enablePickObjectAndFavoriteObjectButtons];
    }];
}

#pragma mark - Public methods
- (IBAction)pickObject:(id)sender
{
    [self resetObjectInfoFields];
    MSObject *object =  [self.codingChallenge pickObject];
    if (!object) {
        return;
    }
    if (object.dataType == MSDataTypeImage && object.objectData) {
        [self loadObjectImage:object];
    }
    else {
        [self enablePickObjectAndFavoriteObjectButtons];
        self.dataInfo.text = object.objectData;
        self.imageView.image = [UIImage imageNamed:MSNoImage];
    }
    if (object) {
        self.userInfo.text = [NSString stringWithFormat:@"Name : %@ Country : %@",object.user.name, object.user.country];
        self.creationInfo.text = object.creationInfo;
    }
}

- (IBAction)markAsFavorite:(id)sender
{
    [self.codingChallenge markObjectAsFavorite];
}

- (IBAction)displayFavorites:(id)sender
{
    [self performSegueWithIdentifier:MSFavorites sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:MSFavorites])
    {
        MSFavoriteObjectViewController *favoriteObjectViewController = [segue destinationViewController];
        favoriteObjectViewController.favorites = self.codingChallenge.favoriteObjects;
    }
}

#pragma mark - MSCodingChallengeDelegate methods
- (void)objectsReadyToPick:(MSCodingChallenge *)codingChallenge
{
    [self enablePickObjectAndFavoriteObjectButtons];
}

- (void)noObjectLeftToPick:(MSCodingChallenge *)codingChallenge
{
    self.errorInfo.text = MSNoObjectLeft;
    [self disablePickObjectAndFavoriteObjectButtons];
}

- (void)codingChallenge:(MSCodingChallenge *)codingChallenge didFailWithError:(NSError *)error
{
    self.errorInfo.text = MSErrorMsg;
    [self resetObjectInfoFields];
}

@end
