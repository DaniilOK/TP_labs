//
//  Record.m
//  TP_lab8_1
//
//  Created by Admin on 18.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Record.h"

@implementation Record

-(void)saveContext

{{
    
    NSError *error = nil;
    
    NSManagedObjectContext *managedObjectCont = self.managedObjectContext;
    
    if(nil != managedObjectCont) {
        
        if([managedObjectCont hasChanges] && ![managedObjectCont
                                               
                                               save:&error]){
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
            abort();
            
        }
        
    }
    
}
    
}

-(NSArray*)getAllFlights

{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Record"
                                   
                                              inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError* error;
    
    NSArray *fetchedRecords = [self.managedObjectContext
                               
                               executeFetchRequest:fetchRequest error:&error];
    
    
    
    return fetchedRecords;
    
}

@end
