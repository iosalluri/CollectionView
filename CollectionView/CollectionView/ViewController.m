//
//  ViewController.m
//  CollectionView
//
//  Created by JAYANTH on 8/4/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"
#import "MenuItemCollectionViewCell.h"

#import "Recipe.h"
#import "imageDetailVeiwScreen.h"
#import <UIKit/UIKit.h>


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, strong) NSArray *imageItemNameArray;
@property (nonatomic, strong) NSMutableArray *recipesArray;


@end



@implementation ViewController

-(void)loadView{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Today's Menu";
    
    UIImageView *backgroungImageView = [[UIImageView alloc]initWithFrame: self.view.bounds];
    
    backgroungImageView.image = [UIImage imageNamed:@"wood-background.png"];
    
    [self.view addSubview:backgroungImageView];
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood-background.png"]];

    
    self.recipesArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    Recipe *recipe1 = [[Recipe alloc] init];
    recipe1.imageName = @"avocado-mozz-plate.png";
    recipe1.title = @"Avacado with Buffalo Mozzarella";
    [self.recipesArray addObject:recipe1];
    
    Recipe *recipe2 = [[Recipe alloc] init];
    recipe2.imageName = @"burger-plate.png";
    recipe2.title = @"Camembert Burger with Pear and Cranberries";
    [self.recipesArray addObject:recipe2];
    
    Recipe *recipe3 = [[Recipe alloc] init];
    recipe3.imageName = @"chicken-breast-plate.png";
    recipe3.title = @"Chicken Breast With Caponata and Guacamole";
    [self.recipesArray addObject:recipe3];
    
    Recipe *recipe4 = [[Recipe alloc] init];
    recipe4.imageName = @"chicken-curry-plate.png";
    recipe4.title = @"Chicken Curry";
    [self.recipesArray addObject:recipe4];
    
    Recipe *recipe5 = [[Recipe alloc] init];
    recipe5.imageName = @"schnitzel-plate.png";
    recipe5.title = @"Herb Schnitzel with Sweet Potato Fries";
    [self.recipesArray addObject:recipe5];
    
    Recipe *recipe6 = [[Recipe alloc] init];
    recipe6.imageName = @"mushroom-lasagna-plate.png";
    recipe6.title = @"Mushroom Lasagna";
    [self.recipesArray addObject:recipe6];
    
    
    self.navigationController.navigationBar.titleTextAttributes =
     @{NSForegroundColorAttributeName:[UIColor blueColor]};
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView setPagingEnabled:YES];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width,  self.view.frame.size.height - 20) collectionViewLayout:layout];
    

    
    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
    
    
    [self.collectionView registerClass:[MenuItemCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    _imagesArray = @[@"avocado-mozz-plate.png", @"burger-plate.png", @"chicken-breast-plate.png", @"chicken-curry-plate.png", @"schnitzel-plate.png", @"mushroom-lasagna-plate.png"];
    
    
    self.imageItemNameArray = @[@"Avacado with Buffalo Mozzarella",@"Camembert Burger with Pear and Cranberries",@"Chicken Breast With Caponata and Guacamole",@"Chicken Curry",@"Herb Schnitzel with Sweet Potato Fries",@"Mushroom Lasagna"];
    
    
    [self.view addSubview:self.collectionView];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.recipesArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   MenuItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
 
//    NSString *itemImageString = [self.imagesArray objectAtIndex:indexPath.item];
//    
//    
//    [cell setTopImage:itemImageString];
//    
//    
//    
//   
//    
//   // [cell ];
//    
//    NSString *itemString;
//    
//    itemString = [self.imageItemNameArray objectAtIndex:indexPath.row];
//    
//    [cell setImageLabel:itemString];
  
   //cell.backgroundColor=[UIColor greenColor];
    
    
    Recipe *theRecipe = self.recipesArray[indexPath.row];
//    [cell setTopImage:theRecipe.imageName];//[dict valueForkey]
//    [cell setImageLabel:theRecipe.title];
    [cell updateCellWithObj:theRecipe];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(190, 548);
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    
[collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
    MenuItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    NSString *itemImage = [self.imagesArray objectAtIndex:indexPath.item];
    
    
    [cell setTopImage:itemImage];
    
    
    imageDetailVeiwScreen *myiVS = [[imageDetailVeiwScreen alloc] initWithNibName:nil bundle:nil];
    
    [myiVS setDescrptionImage:itemImage];
    
    [self.navigationController pushViewController:myiVS animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
