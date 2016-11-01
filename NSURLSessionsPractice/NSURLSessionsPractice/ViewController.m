//
//  ViewController.m
//  NSURLSessionsPractice
//
//  Created by JAYANTH on 10/5/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *itemsArray;
@property (strong, nonatomic) UITableView *table;

@end

@implementation ViewController

@synthesize table;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
        self.table.delegate = self;
        self.table.dataSource = self;
        [self.view addSubview:self.table];
   

    
    NSURL *url = [NSURL URLWithString: @"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLWz5rJ2EKKc_XOgcRukSoKKjewFJZrKV0&key=AIzaSyBkKJRvNKAJ4cgdVY604OfkzhqHh7bvyi0"];
    
    NSURLSession *sessions = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [sessions dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.itemsArray = [json valueForKey:@"items"];
        
        NSArray *sampItems = [json valueForKey:@"items"];
        
        
        NSDictionary *sampDict = [sampItems valueForKey:@"snippet"];
        
       NSDictionary *imageDict = [sampDict valueForKey:@"thumbnails"];
        
        NSDictionary *dictInsi = [imageDict valueForKey:@"high"];
        
        //Class *objName =  [array objectAtIndex:4] //// array[4];
        //sClass *objName = [dict valueForKey:@"name"] /// dict[@"name"]
        
        
        NSLog(@"%@", json);
        
    }];
    
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
