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
 *   The delegate of the MSCodingChallenge that you want to receive messages of what is happening. Not required.
 */
@property (nonatomic, assign) id <MSCodingChallengeDelegate> delegate;

/**
 *   Array of MSObjects, which user select as favorite.
 */
@property (nonatomic, strong) NSArray *favoriteObjects;

/**
 *   Returns an MSCodingChallenge object.
 *
 *   @param codingChallengeDelegate The delegate of the MSCodingChallenge that you want to receive messages of what is happening.
 *
 *   @return The MSCodingChallenge object.
 */
- (instancetype)initWithDelegate:(id<MSCodingChallengeDelegate>)codingChallengeDelegate;

/**
 *   Fetch objects. So that user can pick random object.
 */
- (void)fetchObjects;

/**
 *   Randomly pick an MSObject.
 */
- (MSObject *)pickObject;

/**
 *   Mark displaying MSObject as favorite.
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
