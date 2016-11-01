//
//  ViewController.m
//  tempProjectSpace
//
//  Created by JAYANTH on 7/17/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

//
//  ViewController.m
//  ContactsApp
//
//  Created by JAYANTH on 4/30/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"
#import "ContactDetailViewController.h"
#import <UIKit/UIKit.h>
#import "AddNewContactViewController.h"

@interface ViewController () <AddNewContactViewControllerDelegate>
{
    
    UILabel *_nameDataLabel;
    UIButton *_passbutton;
}

@property(strong, nonatomic) UITableView *dtable;
@property(nonatomic,assign) UIBarStyle barStyle;
@property(nonatomic, strong) NSMutableDictionary *animals;

//@property(nonatomic, strong) NSDictionary * mutableAnimals;
@property(nonatomic, strong) NSArray *animalSectionTitles;
@property(nonatomic, strong) UISearchController *searchController;
@property(nonatomic, strong) NSArray *filterContent;
@property(nonatomic, strong) UISearchBar *namesSearchBar;
@property(nonatomic, strong) NSString *passingRows;

@end

@implementation ViewController
@synthesize dtable;


-(void)loadView{
    UIView *theView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = theView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.namesSearchBar.text = @"Revanth";
    self.title = @"All Contacts";
    
    //Search Bar
    self.namesSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    self.namesSearchBar.delegate = self;
    [self.view addSubview:self.namesSearchBar];
    
    //table
    CGFloat tableY = self.namesSearchBar.frame.origin.y+self.namesSearchBar.frame.size.height;
    
    CGFloat heightY = self.view.frame.size.height - tableY;
    
    self.dtable = [[UITableView alloc] initWithFrame:CGRectMake(0, tableY, self.view.frame.size.width, heightY) style:UITableViewStylePlain];
    self.dtable.dataSource = self;
    self.dtable.delegate = self;
    [self.view addSubview:self.dtable];
    
    //    self.animals = @{@"B" : @[@"Bear", @"Black Swan", @"Buffalo"],
    //                     @"C" : @[@"Camel", @"Cockatoo"],
    //                     @"D" : @[@"Dog", @"Donkey"],
    //                     @"E" : @[@"Emu"],
    //                     @"G" : @[@"Giraffe", @"Greater Rhea"],
    //                     @"H" : @[@"Hippopotamus", @"Horse"],
    //                     @"K" : @[@"Koala"],
    //                     @"L" : @[@"Lion", @"Llama"],
    //                     @"M" : @[@"Manatus", @"Meerkat"],
    //                     @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
    //                     @"R" : @[@"Rhinoceros", @"Revanth"],
    //                     @"S" : @[@"Seagull"],
    //                     @"T" : @[@"Tasmania Devil"],
    //                     @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]};
    //
    //
    //    self.mutableAnimals =
    
    
    self.animals = [[NSMutableDictionary alloc] init];
    
    
    
    [self buttons];
    
    
    
}


-(void)buttons
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithTitle:@"+"
                                  style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(buttonAction:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Groups"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(buttonAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"....searched test ssss:::: %@",searchText);
}// called when text changes (including clear)

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"....User beginned editing ");
}// called when text starts editing


-(void)buttonAction:(id)sender
{
    AddNewContactViewController *addContactVC = [[AddNewContactViewController alloc] init];
    
    addContactVC.delegate = self;
    
    
    [self.navigationController pushViewController:addContactVC animated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    
    
    return self.animals.count;
}

//Function for Number of Rows in Section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *sections = [self.animalSectionTitles objectAtIndex:section];
    
    NSArray *sectionRows = [_animals objectForKey:sections];
    
    return sectionRows.count
    ;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.animalSectionTitles objectAtIndex:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    
    NSString *sectionTitle = [_animalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [_animals objectForKey:sectionTitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    
    
    return cell;
}



- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
    
    [tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(BOOL)searchController:(UISearchController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    //    [self.filterContent:searchStringscope:[[self.searchController.searchBar scopeButtonTitles]objectAtIndex:[self.searchController.searchBar selectedScopeButtonIndex]]];
    return YES;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContactDetailViewController *contactDeatilVC = [[ContactDetailViewController alloc] init];
    
    
    NSString *sectionTitle = [_animalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [_animals objectForKey:sectionTitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    _passingRows = animal;
    contactDeatilVC.nameData = self.passingRows;
    
    
    [self.navigationController pushViewController:contactDeatilVC animated:YES];
    
}


- (void)dataFromController:(NSString *)data
{
    
    if (data.length > 0) {
        char firstChar = [data characterAtIndex:0];
        
        NSString *firstString = [NSString stringWithFormat:@"%c",firstChar];
        
        NSMutableArray *bArray = [self.animals objectForKey:firstString];
        
        if (bArray == nil) {
            bArray = [[NSMutableArray alloc]init];
            [bArray addObject:data];
            
            [self.animals setObject:bArray forKey:firstString];
        }
        else {
            [bArray addObject:data];
        }
        
        
        self.animalSectionTitles = [[_animals allKeys]sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        
        _passbutton.enabled = NO;
        
        [self.dtable reloadData];
    }
    
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _animalSectionTitles;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



