//
//  HomeViewController.h
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 12/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "UserModel.h"

@interface HomeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView *drinkTextView;
@property (nonatomic, retain) UserModel *model;


@end
