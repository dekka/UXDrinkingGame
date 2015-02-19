//
//  FavoritesViewController.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 12/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "FavoritesViewController.h"
#import "HomeViewController.h"
#import "DrinkEvent.h"
#import "TabBarViewController.h"

@interface FavoritesViewController () <UITableViewDataSource, UITableViewDelegate, NSCoding>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) HomeViewController *homeVC;
@property (nonatomic, strong) UserModel *model;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.title = @"Favorites";
    
    for (id controller in self.tabBarController.viewControllers) {
        if ([controller isKindOfClass:[HomeViewController class]]) {
            HomeViewController *homeVC = controller;
            self.model = homeVC.model;
        }
    }
    
    TabBarViewController *tabBarVC = (TabBarViewController *)self.tabBarController;
    self.model = tabBarVC.userModel;
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TabBarViewController *tabBarVC = (TabBarViewController *)self.tabBarController;
    return tabBarVC.userModel.favoritesArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    TabBarViewController *tabBarVC = (TabBarViewController *)self.tabBarController;
    cell.textLabel.text = tabBarVC.userModel.favoritesArray[indexPath.row];
    
    return cell;
}




@end
