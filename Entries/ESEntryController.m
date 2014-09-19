//
//  ESEntryController.m
//  Entries
//
//  Created by Chad on 9/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ESEntryController.h"

@interface ESEntryController ()
@property (nonatomic, strong) NSArray *entries;

@end

@implementation ESEntryController



+ (ESEntryController *)sharedInstance {
    static ESEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ESEntryController alloc] init];
        
        // [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}


- (void)addEntry:(NSDictionary *)entry; {
    
    NSMutableArray *mutableEntries = [self.entries mutableCopy]; // ref all objects into a new mutable array
    
    [mutableEntries addObject:entry]; // adds the entry to the mutable array
    
    self.entries = [mutableEntries copy]; //
    
}


- (void)removeEntry:(NSDictionary *)entry; {
    
    NSMutableArray *mutableEntries = [self.entries mutableCopy]; // ref all objects into a new mutable array
    
    [mutableEntries removeObject:entry]; // removes the entry to the mutable array
    
    self.entries = [mutableEntries copy];
    
    
}


- (void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry; {
    
    if ([self.entries containsObject:oldEntry]) {
        
        NSMutableArray *mutableEntries = [self.entries mutableCopy]; // ref all objects into a new mutable array
        
        NSUInteger index = [mutableEntries indexOfObjectIdenticalTo:oldEntry];
        [mutableEntries replaceObjectAtIndex:index withObject:newEntry];
        
        self.entries = [mutableEntries copy];
        
    }
    

    
    
    
}


@end
