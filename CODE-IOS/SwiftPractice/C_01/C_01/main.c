//
//  main.c
//  C_01
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#include <stdio.h>

// 结构体类型
struct Persn {
    int age;
    float height;
};

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
//    printf("李英普\n");
//    // here is coding
//
//    int i = 0;
//    
//    // 条件语句
//    if (i < 8) {
//        printf("i<8");
//    } else {
//        printf("i>8");
//    }
//    
    // 循环语句
    for (int j = 2; j < 23; j = j+2) {
        
        printf("%d\n",j);
    }
    
    // end
    return 0;
}
