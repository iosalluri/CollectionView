//
//  Person.h
//  NSURLSessionExample5Oct
//
//  Created by JAYANTH on 10/5/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *designation;
@property(nonatomic) NSString *gender;
@property(nonatomic) int age;

-(void)run;
@end
