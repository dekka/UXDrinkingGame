//
//  UserModel.h
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/17/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject <NSCoding>

@property (nonatomic, strong) NSMutableArray *favoritesArray;
@property (nonatomic, strong) NSString *drinkCondition;

-(void)saveFavoritesArray;
-(void)addToFavorites;

@end
