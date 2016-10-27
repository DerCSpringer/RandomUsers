//
//  FetchUserData.h
//  Testing
//
//  Created by Patricia Springer on 10/26/16.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UsersTVC.h"

@interface FetchUserData : UsersTVC

@property (nonatomic, strong) NSURL *usersURL;
@property (nonatomic, strong) NSDictionary *results;

-(void)fetchUsers;

@end
