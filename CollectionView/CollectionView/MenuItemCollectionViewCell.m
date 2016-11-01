//
//  MenuItemCollectionViewCell.m
//  CollectionView
//
//  Created by JAYANTH on 8/5/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "MenuItemCollectionViewCell.h"



@implementation MenuItemCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        UIImageView *menuImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100,self.frame.size.width, self.frame.size.height-350)];
        //menuImageView.backgroundColor = [UIColor redColor];
        menuImageView.tag = 100;
        [self addSubview:menuImageView];
        
        
        UILabel *menuItemLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 300, self.frame.size.width, self.frame.size.height-300)];
        
       // menuItemLabel.text = @"Revanth thinetivi";
        
        menuItemLabel.textColor = [UIColor blueColor];
        
        menuItemLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
        menuItemLabel.numberOfLines = 0;
        
        menuItemLabel.tag = 110;
        
        [self boldFontForLabel:menuItemLabel];
        
        
     //  menuItemLabel.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:menuItemLabel];

    }
    return self;
}

-(void)setTopImage:(NSString *)t_image{
    
    UIImageView *anImageView = (UIImageView *)[self viewWithTag:100];
    
   UIImage *itemImage = [UIImage imageNamed:t_image];
    
//    NSURL *url = [NSURL URLWithString:@"http://i.imgur.com/ytxO16A.png"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *img = [[UIImage alloc] initWithData:data];

    anImageView.image = itemImage;

/*
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://i.imgur.com/ytxO16A.png"]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *anImageView = (UIImageView *)[self viewWithTag:100];
            anImageView.image = [UIImage imageWithData: data];
        });
    });
*/
}

-(void)setImageLabel:(NSString*)iLabel{
    
    UILabel *anImageLabel = (UILabel *)[self viewWithTag:110];
    
    anImageLabel.text = iLabel;
    
}


-(void)boldFontForLabel:(UILabel *)label{
    UIFont *currentFont = label.font;
    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
    label.font = newFont;
}


-(void)updateCellWithObj:(Recipe *)anRecipe{
    
    UIImageView *anImageView = (UIImageView *)[self viewWithTag:100];
    
    UIImage *itemImage = [UIImage imageNamed:anRecipe.imageName];
    
    anImageView.image = itemImage;
    

    
    
    
    UILabel *anImageLabel = (UILabel *)[self viewWithTag:110];
    
    anImageLabel.text = anRecipe.title;

}





@end
