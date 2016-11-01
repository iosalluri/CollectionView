//
//  main.c
//  22OctPractice
//
//  Created by JAYANTH on 10/22/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#include <stdio.h>

//int main(int argc, const char * argv[]) {
//    // insert code here...
//    
//    int n;
//    
//    printf("Enter any number:");
//    scanf("%d", &n);
//    
//    if (n <= 0) {
//        
//        printf("Please enter a value more than zero/");
//
//    }
//    
//    else if (n/2 == 0) {
//        
//        printf("The Entered Number is an Even Number");
//    }
//    
//    else
//        
//        printf("The Entered Number is an Odd Number");
//        
//    
//    
//    return 0;
//}


//int main()
//{
//    
//    int n, result = 0, i;
//    
//    printf("Enter a number to get sum of first n Numbers:");
//    scanf("%d", &n);
//    
//    for(i=0; i<=n; i++){
//    
//     result =  result + i  ;
//    
//}
//    
//    printf("Value is:%d\n", result);
//   
//    
//    return 0;
//    
//}


//int main()
//{
//    
//    int n, evenresult = 0, oddresult = 0, i;
//    
//    printf("Enter a number to get sum of first n Numbers:");
//    scanf("%d", &n);
//    
//    for(i=2; i<=n; i+=2)
//    {
//        
//
//           evenresult =  evenresult + i  ;
//       
//    }
//    
//    printf("Value is:%d\n", evenresult);
//    
//   
//    
//    
//    return 0;
//    
//}


int main()
{
    
    int n,  oddresult = 0, i;
    
    printf("Enter a number to get sum of first n Numbers:");
    scanf("%d", &n);
    
    for(i=1; i<=n; i+=2)
    {
        
        
        oddresult =  oddresult + i  ;
        
    }
    
    
    
    printf("Value is:%d\n", oddresult);
    
    
    return 0;
    
}
