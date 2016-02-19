//
//  MSUtility.m
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "MSUtility.h"

@implementation MSUtility

+ (void)loadImage:(NSURL *)url withCompletion:(void (^)( NSData *imageData, NSError *error))completion
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject];
    
    NSURLSessionDataTask *task = [defaultSession dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(!error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(data,nil);
            });
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil,error);
            });
        }
    }];
    
    [task resume];
}

@end
