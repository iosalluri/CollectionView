//
//  ViewController.m
//  NSURLSessionExample5Oct
//
//  Created by JAYANTH on 10/5/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface NSURLSessionR
+(NSURLSession *)sharedSession;
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *revanth = [[Person alloc] init];
    revanth.name = @"Rrgsgw";
    revanth.age = 35;
    [revanth run];
    
    NSURL *theURL = [NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:theURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"dataaaa: %@",data);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", json);
        
    }];
    //[dataTask resume];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
