//
//  RoomTableViewCell.m
//  RoomFinderApp
//
//  Created by JAYANTH on 8/8/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "RoomTableViewCell.h"

@implementation RoomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)dataForCell:(CellData *)cData{
    
    UILabel *roomText = (UILabel *)[self viewWithTag:130];
    
    roomText.text = cData.room;
    
    UILabel *durationText = (UILabel *)[self viewWithTag:100];
    
    durationText.text = cData.duration;
    
    UILabel *timeDetailsText = (UILabel *)[self viewWithTag:110];
    
    timeDetailsText.text = cData.timeDetails;
    
    UILabel *numbOfMembersText = (UILabel *)[self viewWithTag:120];
    
    numbOfMembersText.text = cData.numbOfMembers;
    
    
}

@end
