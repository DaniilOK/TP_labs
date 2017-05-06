//
//  main.m
//  TP_lab5_2
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Analyser.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        Analyser *analyser = [[Analyser alloc] init];
        [analyser foo:@"hi Hi hello Hello my world my world i like you very much my world ki my like"];
    }
    
    return 0;
}
