//
//  MenuCollectionViewCell.m
//  CollectionViewStoryboardandNib
//
//  Created by JAYANTH on 8/8/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "MenuCollectionViewCell.h"


@implementation MenuCollectionViewCell

//- (id)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]){
//        UIImageView *menuImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100,self.frame.size.width, self.frame.size.height-350)];
//        //menuImageView.backgroundColor = [UIColor redColor];
//        menuImageView.tag = 100;
//        [self addSubview:menuImageView];
//        
//        
//        UILabel *menuItemLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 300, self.frame.size.width, self.frame.size.height-300)];
//        
//        // menuItemLabel.text = @"Revanth thinetivi";
//        
//        menuItemLabel.textColor = [UIColor whiteColor];
//        
//        menuItemLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
//        menuItemLabel.numberOfLines = 0;
//        
//        menuItemLabel.tag = 110;
//        
//        [self boldFontForLabel:menuItemLabel];
//        
//        
//        //  menuItemLabel.backgroundColor = [UIColor yellowColor];
//        
//        [self addSubview:menuItemLabel];
//        
//    }
//    return self;
//}


-(void)setTopImage:(NSString *)t_image{
    
    UIImageView *anImageView = (UIImageView *)[self viewWithTag:100];
    
    UIImage *itemImage = [UIImage imageNamed:t_image];
    
    anImageView.image = itemImage;
}



//-(void)setImageLabel:(NSString*)iLabel{
//    
//    UILabel *anImageLabel = (UILabel *)[self viewWithTag:110];
//    
//    anImageLabel.text = iLabel;
//    
//}
//
//
//-(void)boldFontForLabel:(UILabel *)label{
//    UIFont *currentFont = label.font;
//    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
//    label.font = newFont;
//}


@end

