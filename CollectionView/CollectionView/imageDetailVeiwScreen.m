//
//  imageDetailVeiwScreen.m
//  CollectionView
//
//  Created by JAYANTH on 8/6/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "imageDetailVeiwScreen.h"
#import "ViewController.h"
#import "MenuItemCollectionViewCell.h"

@implementation imageDetailVeiwScreen


-(void)loadView{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.view.backgroundColor = [UIColor redColor];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wood-background.png"]];
    
   
    UIImageView *menuImageDescriptionView = [[UIImageView alloc]initWithFrame:CGRectMake(-150, 260,350,300)];
    
    
   
    menuImageDescriptionView.backgroundColor = [UIColor clearColor];
    
    menuImageDescriptionView.tag = 100;
    
    
    [self.view addSubview:menuImageDescriptionView];


}

-(void)setDescrptionImage:(NSString *)descriptionImage{
    
    UIImageView *anImageView = (UIImageView *)[self.view viewWithTag:100];
    
    UIImage *descImage = [UIImage imageNamed:descriptionImage];
    
    anImageView.image = descImage;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
