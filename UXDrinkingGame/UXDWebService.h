//
//  UXDWebService.h
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/4/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RKObjectManager;

@interface UXDWebService : NSObject
+ (id)sharedInstance;
@property (nonatomic, strong) RKObjectManager *manager;
@end
