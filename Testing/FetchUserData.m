//
//  FetchUserData.m
//  Testing
//
//  Created by Patricia Springer on 10/26/16.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

#import "FetchUserData.h"
#import "UserDetailsKeys.h"


@implementation FetchUserData



-(void)viewDidLoad
{
    [super viewDidLoad];
    self.usersURL = [[NSURL alloc] initWithString:@"https://randomuser.me/api/?results=20"];
    [self fetchUsers];
    
}

-(void)fetchUsers
{
    dispatch_queue_t fetchQ = dispatch_queue_create("Fetch users", NULL);
    dispatch_async(fetchQ, ^{
        NSData *jsonResult = [NSData dataWithContentsOfURL:self.usersURL];
        NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResult
                                                                            options:0
                                                                              error:NULL];
        NSArray *results = [propertyListResults valueForKeyPath:@"results"];

        dispatch_async(dispatch_get_main_queue(), ^{
            self.userList = results;
        });
    });
}





@end
