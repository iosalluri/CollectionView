//
//  ViewController.m
//  Calculator
//
//  Created by JAYANTH on 10/11/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic) UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.view.frame.size.width-20, 20)];
    [_resultLabel setBackgroundColor:[UIColor yellowColor]];
    [_resultLabel setTextColor:[UIColor greenColor]];
    [_resultLabel setText:@"0"];
    [_resultLabel setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:_resultLabel];
    
    float btnWidth = 40;
    float padding = 10;
    for (int i=0; i<3; i++) {
        
        for(int j=1; j<=3; j++){
        UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [b1 setFrame:CGRectMake(20 + btnWidth*i + padding*i, 80 + (padding*2)*j + (20*j), btnWidth, 20)];
        [b1 setTag:i+1];
        [b1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [b1 setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [b1 setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:b1];
        
        }
    
    }
    
}

-(void)buttonClicked:(UIButton *)sender{
    _resultLabel.text = [NSString stringWithFormat:@"%ld",sender.tag];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
