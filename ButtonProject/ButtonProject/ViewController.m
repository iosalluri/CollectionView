//
//  ViewController.m
//  ButtonProject
//
//  Created by JAYANTH on 2/28/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()



@property UIButton* firstButton;

@property UIButton* secondButton;

@property UILabel* firstLabel;
@property UILabel* secondLabel;

@end


@implementation ViewController

@synthesize firstButton, secondButton, firstLabel, secondLabel;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.firstButton setTitle:@"Jayanth" forState:UIControlStateNormal];
    [self.firstButton sizeToFit];
    
    self.firstButton.center = CGPointMake(210, 350);
    

    [firstButton addTarget:self action:@selector(buttonPressed:)
     forControlEvents: UIControlEventTouchUpInside ];
    
    
    self.secondButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.secondButton setTitle:@"Revanth" forState:UIControlStateNormal];
    [self.secondButton sizeToFit];
    
    self.secondButton.center = CGPointMake(210, 200);
    
    
    [secondButton addTarget:self action:@selector(buttonPressed2:)
          forControlEvents: UIControlEventTouchUpInside ];
    
    
    ///////1st
    //create the frame that will contain our label
    CGRect labelFrame = CGRectMake(20.0f, 60.0f, 380.0f, 50.0f);
    //create the label
    self.firstLabel = [[UILabel alloc] initWithFrame:labelFrame];
    //set the label text
    self.firstLabel.text = @"Jayanth";
    //set the lable font
    self.firstLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    //se the text alignment
    self.firstLabel.textAlignment =  NSTextAlignmentCenter;
    //se the border color and width
    self.firstLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.firstLabel.layer.borderWidth = 1.0;
    //add the label to the view
    [self.view addSubview:self.firstLabel];
    
    CGRect labelFrame1 = CGRectMake(20.0f, 100.0f, 380.0f, 50.0f);
    self.secondLabel = [[UILabel alloc]initWithFrame:labelFrame1];
    self.secondLabel.text = @"YuvRaaj";
    self.secondLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    self.secondLabel.textAlignment = NSTextAlignmentCenter;
    self.secondLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.secondLabel.layer.borderWidth = 1.0;
    [self.view addSubview:self.secondLabel];
    
    
    [self.view addSubview:self.firstButton];
    [self.view addSubview:self.secondButton];
}

- (void)buttonPressed:(UIButton*)firstButton
{
    
    [Flurry logEvent:@"user accumulated points"];
    
    self.firstLabel.text = @"Yuvraaj";
    self.secondLabel.text = @"Jayanth";
}

- (void)buttonPressed2:(UIButton*)secondButton
{
    
    self.firstLabel.text = @"Revanth";
    self.secondLabel.text = @"YuvRaaj";
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
