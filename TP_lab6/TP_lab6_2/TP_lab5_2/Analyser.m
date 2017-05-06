//
//  Analyser.m
//  TP_lab5_2
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "Analyser.h"

@implementation Analyser

- (void)foo:(NSString *)text
{
    NSArray *words = [text componentsSeparatedByString:@" "];
    NSMutableDictionary *statistics = [NSMutableDictionary dictionaryWithDictionary:@{}];
    
    for (NSString* word in words)
    {
        NSNumber *repetitions = [statistics valueForKey:word];
        [statistics setObject:[[NSNumber alloc] initWithLong:([repetitions integerValue]+1)] forKey:word];
    }
    
    NSArray *sortedKeys = [statistics keysSortedByValueUsingComparator:
                  ^NSComparisonResult(id obj1, id obj2) {
                      if ([obj2 integerValue] > [obj1 integerValue])
                          return NSOrderedAscending;
                      if ([obj2 integerValue] < [obj1 integerValue])
                          return NSOrderedDescending;
                      return NSOrderedSame;
                          
                  }];
    
    //NSLog(@"%@", statistics);
    for (int i=0; i<[sortedKeys count] && i<5; i++){
        NSLog(@"%@ = %@", sortedKeys[i],[statistics objectForKey:(sortedKeys[i])]);
    }
}
    
@end
