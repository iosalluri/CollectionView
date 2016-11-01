//
//  Car.m
//  VariablesAndProperties
//
//  Created by JAYANTH on 7/13/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import "Car.h"

@interface Car ()



@property (nonatomic) BOOL isEngineOk;

@end

@implementation Car

@synthesize running = _running;    // Optional for Xcode 4.4+





-(void)printStatusOfRunning{
    NSLog(@"the running status is %d",_running);
}


@end
