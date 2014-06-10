//
//  USStatesController.m
//  USStatesController
//
//  Created by Dmitriy Zakharkin on 5/17/14.
//  Copyright (c) 2014 Dmitriy Zakharkin. All rights reserved.
//

#import "USStatesController.h"

@implementation USStatesController

static NSDictionary *stateAbbreviationsMap = nil;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        _abbreviations = [aDecoder decodeBoolForKey:@"abbreviations"];
        _allowEmpty = [aDecoder decodeBoolForKey:@"allowEmpty"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeBool:_abbreviations forKey:@"abbreviations"];
    [aCoder encodeBool:_allowEmpty forKey:@"allowEmpty"];
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"abbreviations"]) {
        _abbreviations = [value boolValue];
        return;
    }
    if([key isEqualToString:@"allowEmpty"]) {
        _allowEmpty = [value boolValue];
        return;
    }
    [super setValue:value forKey:key];
}

- (NSDictionary *)stateAbbreviationsMap
{
    if (stateAbbreviationsMap == nil) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"USStateAbbreviations" ofType:@"plist"];
        stateAbbreviationsMap = [[NSDictionary alloc] initWithContentsOfFile:plist];
    }
    return stateAbbreviationsMap;
}

-(BOOL)isEditable {
    return NO;
}

-(void)prepareContent {
    NSArray* values;
    if(_abbreviations) {
        values = [[[self stateAbbreviationsMap] allValues] sortedArrayUsingSelector:@selector(compare:)];
    } else {
        values = [[[self stateAbbreviationsMap] allKeys] sortedArrayUsingSelector:@selector(compare:)];
    }
    if(_allowEmpty) {
        NSMutableArray* mar = [values mutableCopy];
        [mar insertObject:@"Not set" atIndex:0];
        values = mar;
    }
    [self setContent:values];
}

@end
