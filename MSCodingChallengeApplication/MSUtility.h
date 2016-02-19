//
//  MSUtility.h
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSUtility : NSObject

+ (void)loadImage:(NSURL *)url withCompletion:(void (^)( NSData *imageData, NSError *error))completion;

@end
