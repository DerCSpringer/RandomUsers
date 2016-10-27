//
//  TestingHelper.m
//  Testing
//
//  Created by Patricia Springer on 10/26/16.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

#import "TestingHelper.h"

@implementation TestingHelper

+(void)fetchImage:(NSURL *)url inCell:(UITableViewCell *)cell
{
    dispatch_queue_t fetchImage = dispatch_queue_create("Thumbnail fetcher", NULL);
    dispatch_async(fetchImage, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *thumbnail = [[UIImage alloc] initWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = thumbnail;
            
        });
    });
    
    
    
}

@end
