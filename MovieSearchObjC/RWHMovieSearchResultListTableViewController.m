//
//  RWHMovieSearchResultListTableViewController.m
//  MovieSearchObjC
//
//  Created by handje on 6/22/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "RWHMovieSearchResultListTableViewController.h"

@interface RWHMovieSearchResultListTableViewController ()

@end

@implementation RWHMovieSearchResultListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
    return cell;
}

@end
