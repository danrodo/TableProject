//
//  CustomTableViewController.m
//  TableProject
//
//  Created by Daniel Rodosky on 5/14/14.
//  Copyright (c) 2014 Dan Rodosky. All rights reserved.
//

#import "CustomTableViewController.h"

@interface CustomTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *colors;
@end

@implementation CustomTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.colors = @[@"red", @"orange", @"blue", @"green", @"yellow", @"purple", @"violet", @"light purple"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 2);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorIdentifier"];
    if(!cell){//cell == nil
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"colorIdentifier"];
    }
    cell.textLabel.text = self.colors[indexPath.row];
    return cell;
}

@end
