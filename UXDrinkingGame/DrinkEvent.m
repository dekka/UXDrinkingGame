//
//  DrinkEvent.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/4/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import "DrinkEvent.h"
#import <RestKit/RestKit.h>

@implementation DrinkEvent


+ (RKObjectMapping*) responseMappingForGet
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[DrinkEvent class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"content" : @"content",
                                                  @"item_url" : @"item_url",
                                                  @"title" : @"title"
                                                  }];
    
    return mapping;
}
@end
