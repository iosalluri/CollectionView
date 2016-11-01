//
//  ViewController.m
//  NSURLSession_Learning
//
//  Created by JAYANTH on 8/8/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *resultsTableView;

@property (nonatomic) NSDictionary *resultsDictionary;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.resultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];

    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.resultsDictionary = json;
        
//        NSLog(@"ggggg::: %@", json);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.resultsTableView reloadData];

        });
        
    }];
    
    [dataTask resume];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *resultsArr = [self.resultsDictionary valueForKey:@"results"];

//    NSDictionary* dict = [NSDictionary dictionaryWithObjects:resultsArr forKeys:[resultsArr valueForKey:@"intField"]];
    
   return resultsArr.count;
}


//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    NSArray *resultsArr = [self.resultsDictionary valueForKey:@"results"];
//    
//    return resultsArr.count;
//    
//}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    NSArray *resultsArr = [self.resultsDictionary valueForKey:@"results"];
    
    NSDictionary *albumDict = resultsArr[indexPath.row];
    
    
    
    NSString *theNotes = [albumDict valueForKey:@"releaseNotes"];
    
    cell.textLabel.text = theNotes;
    cell.textLabel.numberOfLines = 0;
    
    cell.backgroundColor = (indexPath.row%2 == 0) ? [UIColor yellowColor] : [UIColor orangeColor];
    
//    if (indexPath.row%2 == 0) {
//        cell.backgroundColor = [UIColor yellowColor];
//    }
//    else {
//        cell.backgroundColor = [UIColor orangeColor];
//    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
