//
//  MSObject.h
//  MSCodingChallengeFramework
//
//  Created by Masud Shuvo on 2/18/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <Foundation/Foundation.h>

/** @enum MSDataType
 *
 * Enum that specifies the type of the data
 */
typedef NS_ENUM(NSUInteger, MSDataType) {
    /** data type is TEXT */
    MSDataTypeText,
    /** data type is IMG */
    MSDataTypeImage
};

@class MSUser;
@interface MSObject : NSObject

/**
 *  When the object is created.
 */
@property (nonatomic, strong) NSString *creationInfo;

/**
 *  Data type.
 */
@property (nonatomic, assign) MSDataType dataType;

/**
 *  Data details.
 */
@property (nonatomic, strong) NSString *objectData;

/**
 *  User object.
 */
@property (nonatomic, strong) MSUser *user;

/**
 *  Initialize this object based on JSON response from the api parsed into a dictionary.
 *  @param dictionary A dictionary representing the JSON from the API
 *  @return An instance of this object based on the passed dictionary.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
