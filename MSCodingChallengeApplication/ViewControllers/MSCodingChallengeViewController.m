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
- (void)resetObjectInfoFields
{
    self.imageView.image = [UIImage imageNamed:MSPlaceholder];
    self.dataInfo.text = @"";
    self.userInfo.text = @"";
    self.creationInfo.text = @"";
    self.pickObjectButton.enabled = NO;
    self.markAsFavoriteButton.enabled = NO;
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
        self.pickObjectButton.enabled = YES;
        self.markAsFavoriteButton.enabled = YES;
    }];
}

#pragma mark - Public methods
- (IBAction)pickObject:(id)sender
{
    [self resetObjectInfoFields];
    
    MSObject *object =  [self.codingChallenge pickObject];
    
    if (object.dataType == MSDataTypeImage && object.objectData) {
        [self loadObjectImage:object];
    }
    else {
        self.pickObjectButton.enabled = YES;
        self.markAsFavoriteButton.enabled = YES;
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
    self.pickObjectButton.enabled = YES;
    self.markAsFavoriteButton.enabled = YES;
}

- (void)noObjectLeftToPick:(MSCodingChallenge *)codingChallenge
{
    self.errorInfo.text = MSNoObjectLeft;
    self.pickObjectButton.enabled = NO;
    self.markAsFavoriteButton.enabled = NO;
}

- (void)codingChallenge:(MSCodingChallenge *)codingChallenge didFailWithError:(NSError *)error
{
    self.errorInfo.text = MSErrorMsg;
}

@end
