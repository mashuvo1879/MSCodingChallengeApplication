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

@interface MSCodingChallengeViewController () <MSCodingChallengeDelegate>

@property (nonatomic, strong) MSCodingChallenge *codingChallenge;

@end

@implementation MSCodingChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Objects";
    self.codingChallenge = [[MSCodingChallenge alloc] initWithDelegate: self];
    [self.codingChallenge fetchObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (void)resetObjectInfoFields
{
    self.imageView.image = [UIImage imageNamed:@"placeholder"];
    self.dataInfo.text = @"";
    self.userInfo.text = @"";
    self.creationInfo.text = @"";
    self.pickObjectButton.enabled = NO;
    self.markAsFavoriteButton.enabled = NO;
}

- (void)loadObjectImage:(MSObject *)object
{
    self.activityIndicator.hidden = NO;
    [MSUtility loadImage:[NSURL URLWithString:object.objectData] withCompletion:^(NSData *imageData, NSError *error) {
        if (error) {
            self.imageView.image = [UIImage imageNamed:@"no-image"];
        }
        else {
            self.imageView.image = [UIImage imageWithData:imageData];
        }
        
        self.activityIndicator.hidden = YES;
        self.pickObjectButton.enabled = YES;
        self.markAsFavoriteButton.enabled = YES;
    }];
}

- (void)objectsReadyToPick:(MSCodingChallenge *)codingChallenge
{
    self.pickObjectButton.enabled = YES;
    self.markAsFavoriteButton.enabled = YES;
}

- (void)noObjectLeftToPick:(MSCodingChallenge *)codingChallenge
{
    self.errorInfo.text = @"No more object left to pick.";
    self.pickObjectButton.enabled = NO;
    self.markAsFavoriteButton.enabled = NO;
}

- (void)codingChallenge:(MSCodingChallenge *)codingChallenge didFailWithError:(NSError *)error
{
    self.errorInfo.text = @"unable to load object.";
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
