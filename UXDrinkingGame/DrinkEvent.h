//
//  DrinkEvent.h
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/4/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RKObjectMapping;

@interface DrinkEvent : NSObject
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *item_url;
@property (nonatomic, copy) NSString *title;
+ (RKObjectMapping*) responseMappingForGet;
@end
