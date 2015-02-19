//
//  UserModel.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/17/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import "UserModel.h"
#import "HomeViewController.h"
#import "FavoritesViewController.h"

@interface UserModel () <NSCoding>

@property (nonatomic, strong) FavoritesViewController *favoritesVC;

@end

@implementation UserModel

- (id)init {
    if (self) {
        self = [super init];
    }
    if (!self.favoritesVC) {
        self.favoritesVC = [FavoritesViewController new];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return nil;
}

-(id)encodeWithCoder:(NSCoder *)aCoder {
    return nil;
}


- (void)saveFavoritesArray {
    [NSKeyedArchiver archiveRootObject:self.favoritesArray toFile:[self.favoritesVC dataFilePath]];
}

-(void)addToFavorites {
//    [self.favoritesArray addObject:self.homeVC.drinkTextView.text];
}

@end
