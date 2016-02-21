//
//  MSFavoriteObjectViewController.m
//  MSCodingChallengeApplication
//
//  Created by Masud Shuvo on 2/19/16.
//  Copyright © 2016 Masud Shuvo. All rights reserved.
//

#import "MSFavoriteObjectViewController.h"
#import <MSCodingChallenge/MSObject.h>
#import <MSCodingChallenge/MSUser.h>
#import "MSTableViewCell.h"
#import "MSUtility.h"

static NSString *const MSTableViewCellNibName = @"MSTableViewCell";

@interface MSFavoriteObjectViewController ()<UITableViewDelegate, UITableViewDelegate>

/**
 *   This table view will display all stored favorite objects.
 */
@property  (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation MSFavoriteObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark UITableViewDataSource Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.favorites count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [NSString stringWithFormat:@"Cell %tu",indexPath.row];
    MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:MSTableViewCellNibName bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.objectImage.image = [UIImage imageNamed:@"placeholder"];
        MSObject *object = [self.favorites objectAtIndex:indexPath.row];
        cell.userInfo.text = [NSString stringWithFormat:@"Name:%@ Country:%@",object.user.name,object.user.country];
        if (object.dataType == MSDataTypeImage) {
            [MSUtility imageData:[NSURL URLWithString:object.objectData] withCompletion:^(NSData *imageData, NSError *error) {
                if (!error) {
                    cell.objectImage.image = [UIImage imageWithData:imageData];
                }
                else {
                    cell.objectImage.image = [UIImage imageNamed:@"no-image"];
                }
            }];
        }
        else {
            cell.objectImage.image = [UIImage imageNamed:@"no-image"];
        }
        cell.creationInfo.text = object.creationInfo;
    }
    return cell;
}

#pragma - mark UITableViewDelegate Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
