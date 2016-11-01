//
//  SecondViewController.m
//  NSURLsessions
//
//  Created by JAYANTH on 8/6/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation SecondViewController

- (IBAction)buttonAction:(id)sender {
    
    
    ThirdViewController *controller = [[ThirdViewController alloc] initWithNibName:nil bundle:nil];

    
 
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
}
@end

