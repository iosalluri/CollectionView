//
//  main.m
//  ArraysandStrings
//
//  Created by JAYANTH on 2/27/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

{
    
}
@property NSString *initial;
@property int theAge;
@property char theGender;
- (void) displayHumanDetails;
@end

@implementation Human

@synthesize initial;
@synthesize theAge;
@synthesize theGender;

- (void) displayHumanDetails
{
    NSLog(@"initial Is:::::%@, %d\n %c",[self initial], self.theAge, self.theGender);
}

@end

int main() {
    //////Array and string Practice                                          Ask Revanth....
    
    Human *jayanth = [[Human alloc]init];
    [jayanth setInitial:@"Alluri"];
    jayanth.theAge = 20;
    jayanth.theGender = 'M';

    Human *revanth = [[Human alloc]init];
    [revanth setInitial:@"Yarlagadda"];
    revanth.theAge = 25;
    revanth.theGender = 'M';
    
    
    NSString *mySentenceABCD = @"ABCD";
    NSString *mySentenceDDDD = @"DDD";
    NSString *mySentenceFFF = @"FFF";
    
    NSArray *allNamesArray = [NSArray arrayWithObjects: mySentenceABCD, mySentenceDDDD, @"GGGG",mySentenceFFF, nil];
    
    NSArray *humanObjectsArray = [NSArray arrayWithObjects: jayanth, revanth, nil];

    NSString *mySentence = [allNamesArray componentsJoinedByString: @" "];
    
    Human *firstHuman  = humanObjectsArray[0];
    
    for(int i=0; i<humanObjectsArray.count; i++){
        Human *theHuman = humanObjectsArray[i];
        
        NSLog(@"initial in for loop::: %d",theHuman.theAge);
    }
    NSLog(@"first human name:::: %@ humanObjecdfwtwdfsdtsArray[0]:::::: %@",firstHuman.initial,humanObjectsArray[0]);
    NSLog(@"%@", allNamesArray);
    NSLog(@"humanObjectsArray::::: \n %@", humanObjectsArray);
    NSLog(@"%@", mySentence);
    

    //////Splitting Strings in to an array           ASK Revanth
    
    NSString *splitString = @"Hello How are you doing today";
    
    NSArray *myArray = [splitString componentsSeparatedByString:@" "];
    
    NSLog(@"splitted array %@ ", myArray);
    
   
    
    return 0;

}
