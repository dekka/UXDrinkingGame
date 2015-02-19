//
//  UserModel.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/17/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import "UserModel.h"
#import "HomeViewController.h"

@interface UserModel ()

@end

@implementation UserModel

- (instancetype)initAndUnarchive {
    if (self = [super init]) {
        self.favoritesArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dataFilePath]];
    }
    
    return self;
}

- (void)saveFavoritesArray {
    [NSKeyedArchiver archiveRootObject:self.favoritesArray toFile:[self dataFilePath]];
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"UXDFavorites.plist"];
}


@end
