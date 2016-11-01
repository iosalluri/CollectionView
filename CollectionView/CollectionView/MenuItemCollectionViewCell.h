//
//  MenuItemCollectionViewCell.h
//  CollectionView
//
//  Created by JAYANTH on 8/5/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface MenuItemCollectionViewCell : UICollectionViewCell


-(void)setTopImage:(NSString *)t_image;

-(void)setImageLabel:(NSString *)iLabel;

-(void)updateCellWithObj:(Recipe *)anRecipe;

@end
