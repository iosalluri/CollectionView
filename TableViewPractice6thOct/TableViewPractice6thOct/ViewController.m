//
//  ViewController.m
//  TableViewPractice6thOct
//
//  Created by JAYANTH on 10/6/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSArray *itemsArray;

@end

@implementation ViewController

@synthesize table;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
//    self.array = @[@"kjhgjkg", @"dbdsgdsh",@"agraefdvzv", @"ueuyhjtyjrt", @"xbgsffgfnt", @"kiutk", @"uotligjymf", @"yjrhgdfnfhdnf", @"rthryhr", @"jkyrujmrymt"];
    
    
    
    NSURL *url = [NSURL URLWithString: @"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLWz5rJ2EKKc_XOgcRukSoKKjewFJZrKV0&key=AIzaSyBkKJRvNKAJ4cgdVY604OfkzhqHh7bvyi0"];
    
    NSURLSession *sessions = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [sessions dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.itemsArray = [json valueForKey:@"items"];
        
        NSLog(@"%@", json);
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
            
            //Your code goes in here
            NSLog(@"Main Thread Code");
            [self.table reloadData];

        }];
        
    }];
    
    [dataTask resume];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.itemsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.tag = 10;
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
      
        if(indexPath.row % 2 == 0)
        
            cell.backgroundColor = [UIColor redColor];
        else
            cell.backgroundColor = [UIColor blueColor];
        
       
        
        
        UILabel *titleLabel = [cell.contentView viewWithTag:1];
        
        titleLabel.textColor = [UIColor blackColor];
        
        titleLabel.backgroundColor = [UIColor whiteColor];
        
        [cell addSubview:titleLabel];
        
        
       
        UILabel *descriptionLabel = [cell.contentView viewWithTag:2];
        
        descriptionLabel.textColor = [UIColor whiteColor];
        
        descriptionLabel.backgroundColor = [UIColor blackColor];
        
        descriptionLabel.tag = 2;
         
        [cell addSubview:descriptionLabel];
        
    }
    
   
  

    UILabel *titleLabel = [cell.contentView viewWithTag:1];
    
    //titleLabel.numberOfLines = 0;
    
    NSArray *titleItems = [self.itemsArray objectAtIndex:indexPath.row];
    
    NSDictionary *titleDict = [titleItems valueForKey:@"snippet"];
    
    NSString *titleString =  [titleDict valueForKey:@"title"];

    titleLabel.text = titleString;
    
    CGFloat titleLbelHtWidth = titleLabel.frame.size.width;
    
    CGFloat titleLbelHt = [self getLabelHeight:titleLabel];
    
    titleLabel.frame = CGRectMake(0, 10, titleLbelHtWidth, titleLbelHt);
    
    
   
    
    
    UILabel *descriptionLabel = [cell.contentView viewWithTag:2];
    
    descriptionLabel.numberOfLines = 0;
    
    NSArray *descrArray = self.itemsArray[indexPath.row];
    
    NSDictionary *descrSnippetDict = [descrArray valueForKey:@"snippet"];
    
    NSString *strngValue = descrSnippetDict[@"description"];
    
    descriptionLabel.text = strngValue;
    
    CGFloat descriptionLabelWidth = descriptionLabel.frame.size.width;
    
    CGFloat descrtnLabelHt =  [self getLabelHeight:descriptionLabel];
    
    CGFloat yFloat = 10 + titleLbelHt + 10;
    
    descriptionLabel.frame = CGRectMake(0, yFloat, descriptionLabelWidth, descrtnLabelHt);
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
//    UITableViewCell *cell;
//    
//    cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    
//    UILabel *label = [cell.contentView viewWithTag:10];
//    
//    CGFloat reqHt = [self getLabelHeight:label];
//    
//    return reqHt + 20.0;
    
    UITableViewCell *cell;
    
    cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *descrptnlabel = [cell.contentView viewWithTag:2];
    
    CGFloat descrnLabelHt = [self getLabelHeight:descrptnlabel];
    
    UILabel *titlelabel = [cell.contentView viewWithTag:1];
    
    CGFloat titleLabelHt = [self getLabelHeight:titlelabel];
    
    CGFloat reqHt = 10 + descrnLabelHt + 10 + titleLabelHt + 10;
    
    return reqHt;
    
}


- (CGFloat)getLabelHeight:(UILabel*)label
{
    CGSize constraint = CGSizeMake(label.frame.size.width, CGFLOAT_MAX);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [label.text boundingRectWithSize:constraint
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:label.font}
                                                  context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
