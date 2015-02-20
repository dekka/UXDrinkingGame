//
//  TabBarViewController.h
//  UXDrinkingGame
//
//  Created by John Clem on 2/19/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface TabBarViewController : UITabBarController

@property (nonatomic, strong) UserModel *userModel;

@end
