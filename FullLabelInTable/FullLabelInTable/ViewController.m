//
//  ViewController.m
//  FullLabelInTable
//
//  Created by JAYANTH on 10/7/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *label = [cell.contentView viewWithTag:10];
    if (indexPath.row%2==0) {
        label.text = @"sdvdsgsgs fff asqer qer4 2 235 2ffa aa 2452 wefas afaf  242 wfafasdvdsgsgs fff asqer qer4 2 235 2ffa aa 2452 wefas afaf  242 wfafasdvdsgsgs fff asqer qer4 22452dtyjh,bhgcdtdfujvcfzsedyulkbjvfxrstryfgkbcxfdxhgjvbcdxsdyghcgfxtyjhdgcfsyhcgjfsdfkjvgkjgfchfkytdyjkghblftrsrergdhjgkhljlhuiytujhvt58t789p87u809iohjgchf";
    }
    else {
        label.text = @"dgsdgsdgsd sdgdsg sdg sgrw 24t2 g2r g24g24 grgrgwf ewfw";
    }
   
    
    CGFloat reqHt = [self getLabelHeight:label];
    
    label.frame = CGRectMake(10, 10, 320, reqHt);
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    
    UITableViewCell *cell;
    
    cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *label = [cell.contentView viewWithTag:10];

    CGFloat reqHt = [self getLabelHeight:label];

    return reqHt + 20.0;
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
