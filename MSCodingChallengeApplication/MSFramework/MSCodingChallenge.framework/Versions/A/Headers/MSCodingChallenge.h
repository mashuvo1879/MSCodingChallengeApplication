//
//  MSCodingChallenge.h
//  MSCodingChallengeFramework
//
//  Created by Masud Shuvo on 2/18/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSObject;
@protocol MSCodingChallengeDelegate;

@interface MSCodingChallenge : NSObject

/**
 *   The delegate of the MSCodingChallenge that you want to receive messages of what is happening.
 */
@property (nonatomic, assign) id <MSCodingChallengeDelegate> delegate;

/**
 *   Array of MSObjects, which user has select as favorite.
 */
@property (nonatomic, strong) NSArray *favoriteObjects;

/**
 *   Returns a MSCodingChallenge object.
 *
 *   @param codingChallengeDelegate The delegate of the MSCodingChallenge that you want to receive messages of what is happening.
 *
 *   @return The MSCodingChallenge object.
 */
- (instancetype)initWithDelegate:(id<MSCodingChallengeDelegate>)codingChallengeDelegate;

/**
 *   Fetch objects. So that later user can pick random object.
 */
- (void)fetchObjects;

/**
 *   Randomly pick an MSObject from avaiable objects.
 */
- (MSObject *)pickObject;

/**
 *   Mark displaying MSObject as favorite. The object will sent to favoriteObjects array.
 */
- (void)markObjectAsFavorite;

@end

@protocol MSCodingChallengeDelegate <NSObject>

@optional

/**
 *   Objects are ready to be picked randomly.
 *   @param codingChallenge The MSCodingChallenge that makes the objects ready.
 */
- (void)objectsReadyToPick:(MSCodingChallenge *)codingChallenge;

/**
 *   No more object is left to pick randomly. All the fetched objects has been picked.
 *   @param codingChallenge The MSCodingChallenge that has no more object to pick.
 */
- (void)noObjectLeftToPick:(MSCodingChallenge *)codingChallenge;

/**
 *   MSCodingChallenge has failed to retreive objects.
 *   @param codingChallenge The MSCodingChallenge that received the error.
 *   @param error Underlying error.
 */
- (void)codingChallenge:(MSCodingChallenge *)codingChallenge didFailWithError:(NSError *)error;

@end
