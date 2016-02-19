//
//  ViewController.m
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "ViewController.h"
#import <MSCodingChallenge/MSCodingChallenge.h>
#import <MSCodingChallenge/MSObject.h>

#define GetFileData(fileName, fileExtension) [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:fileName ofType:fileExtension]]

@interface ViewController () <MSCodingChallengeDelegate>
@property (nonatomic, strong) MSCodingChallenge *codingChallenge;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.codingChallenge = [[MSCodingChallenge alloc] initWithDelegate:self];
//    [self.codingChallenge fetchObjects];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"mockData" ofType:@"json"];
//    
//    NSError *error;
//    
//    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
//    
//    if(error) {
//        NSLog(@"Error reading file: %@", error.localizedDescription);
//    }
//    
//    // Get JSON objects into initial array
//    NSArray *rawExhibits = (NSArray *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
//
//    NSLog(@"%@",[rawExhibits description]);
//    NSMutableArray *myItems = [[NSMutableArray alloc] init];
//    
//    for (NSDictionary *object in rawExhibits) {
//        NSString *objectName = object[@"Name"];
//        NSString *objectType = object[@"Type"];
//        
//        // Create new exhibit object with data procured from JSON object
//        W5BExhibit *exhibit = [[W5BExhibit alloc] initWithExhibitName:objectName exhibitType:objectType];
//        
//        [myItems addObject:exhibit];
//    }
//    
//    self.allExhibits = [[NSArray alloc] initWithArray:myItems];

    self.codingChallenge = [[MSCodingChallenge alloc] initWithDelegate:self];
    [self.codingChallenge fetchObjects];
    
}

- (void)objectsReadyToPick:(MSCodingChallenge *)codingChallenge
{
    MSObject *object = [self.codingChallenge pickObject];
    NSLog(@"%@",[object description]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
