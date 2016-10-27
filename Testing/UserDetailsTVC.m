//
//  UserDetailsTVC.m
//  Testing
//
//  Created by Patricia Springer on 10/26/16.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

#import "UserDetailsTVC.h"
#import "UserDetailsKeys.h"

@interface UserDetailsTVC ()
@property (nonatomic, strong)NSArray *detailFields;


@end

@implementation UserDetailsTVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.detailFields = @[RANDOM_NAME_FIRST, RANDOM_NAME_LAST, RANDOM_GENDER, RANDOM_LOCATION_STREET, RANDOM_LOCATION_CITY];
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
    return [self.detailFields count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"User details" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.userDetails valueForKeyPath:self.detailFields[indexPath.row]];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
