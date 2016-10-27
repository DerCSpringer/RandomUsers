//
//  UsersTVC.m
//  Testing
//
//  Created by Patricia Springer on 10/26/16.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

#import "UsersTVC.h"
#import "FetchUserData.h"
#import "UserDetailsTVC.h"
#import "UserDetailsKeys.h"
#import <AVFoundation/AVFoundation.h>

@interface UsersTVC ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation UsersTVC

-(void)setUserList:(NSArray *)userList
{
    _userList = userList;
    [self.tableView reloadData];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"User cell" forIndexPath:indexPath];
    NSDictionary *user = self.userList[indexPath.row];
    NSMutableString *name = [[NSMutableString alloc] initWithString:[user valueForKeyPath:RANDOM_NAME_FIRST]];
    [name appendString:@" "];
    
    [name appendString:[user valueForKeyPath:RANDOM_NAME_LAST]];
    
    cell.textLabel.text = name;
    cell.imageView.image = [UIImage imageWithData:self.photos[indexPath.row]];
    
    return cell;
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[UserDetailsTVC class]]) {
        UserDetailsTVC *utvc = (UserDetailsTVC *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        utvc.userDetails = self.userList[indexPath.row];
    }
}
@end
