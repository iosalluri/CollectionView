//
//  ViewController.m
//  RoomFinderApp
//
//  Created by JAYANTH on 8/8/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"
#import "RoomTableViewCell.h"
#import "SectionHeaderView.h"
#import "CellData.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *cellDataArray;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.cellDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    CellData *row1 = [[CellData alloc]init];
    row1.room = @"300";
    row1.duration = @"30mins";
    row1.timeDetails = @"4:00pm to 4:30pm";
    row1.numbOfMembers = @"4";
    [self.cellDataArray addObject:row1];
    
    CellData *row2 = [[CellData alloc]init];
    row2.room = @"301";
    row2.duration = @"1hour";
    row2.timeDetails = @"4:00pm to 5:00pm";
    row2.numbOfMembers = @"8";
    [self.cellDataArray addObject:row2];
    
    CellData *row3 = [[CellData alloc]init];
    row3.room = @"302";
    row3.duration = @"2hours";
    row3.timeDetails = @"5:00pm to 7:00pm";
    row3.numbOfMembers = @"7";
    [self.cellDataArray addObject:row3];
    
    CellData *row4 = [[CellData alloc]init];
    row4.room = @"303";
    row4.duration = @"3hours";
    row4.timeDetails = @"5:30pm to 8:30pm";
    row4.numbOfMembers = @"3";
    [self.cellDataArray addObject:row4];
    
    CellData *row5 = [[CellData alloc]init];
    row5.room = @"304";
    row5.duration = @"2hour 30mins";
    row5.timeDetails = @"2:00pm to 4:30pm";
    row5.numbOfMembers = @"10";
    [self.cellDataArray addObject:row5];

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCellIdentifier"];
    
    
    CellData *theRows = self.cellDataArray[indexPath.row];
    
    [cell dataForCell:theRows];
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Adfad";
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SectionHeaderView *sectionView = [[[NSBundle mainBundle]
                                        loadNibNamed:@"SectionHeaderView"
                                        owner:self options:nil]
                                       firstObject];
    return sectionView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    return 60;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
