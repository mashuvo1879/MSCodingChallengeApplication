//
//  MSUser.h
//  MSCodingChallengeFramework
//
//  Created by Masud Shuvo on 2/18/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSUser : NSObject

/**
 *  user name.
 */
@property (nonatomic, strong) NSString *name;

/**
 *  user country.
 */
@property (nonatomic, strong) NSString *country;

/**
 *  Initialize this object based on JSON response from the api parsed into a dictionary.
 *  @param dictionary A dictionary representing the JSON from the API
 *  @return An instance of this object based on the passed dictionary.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
