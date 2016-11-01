//
//  main.c
//  printPatterns
//
//  Created by JAYANTH on 10/11/16.
//  Copyright © 2016 JAYANTH. All rights reserved.
//

#include<stdio.h>

int main(){
    
    int i, j, n, k;
    
    printf("Enter Number of rows:");
    scanf("%d", &n);
     // printf("%d",n);
    
//    for(i=0; i<n; i++){
//        
//        for(j=1; j<=n; j++){
//            
//            printf("%d ", j +(i*n));
//        }
//        
//      printf("\n");
//    }
    
 
           
    for(i=0; i<n; i++){
        
        for(j=0; j<=i; j++){
            
            
            
           printf("* ");
            
        }
        
        printf("\n");
        
        
               
    }
    
    
    for(i=0; i<n; i++){
        
        for(j=n-1; j>i; j--){
            
            
            
            printf("* ");
            
        }
        
        printf("\n");
        
        
        
    }
    
    return 0;
    
}

