//
//  MSUtility.h
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSUtility : NSObject

/**
 * Fetches image data.
 * @param url Url of the image.
 * @param completion Block that is called when image data have been fetched or any error occured.
 */
+ (void)imageData:(NSURL *)url withCompletion:(void (^)( NSData *imageData, NSError *error))completion;

@end
