//
//  FavoritesViewController.h
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 12/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *favoritesArray;

-(NSString *)documentsDirectory;
-(NSString *)dataFilePath;

@end
