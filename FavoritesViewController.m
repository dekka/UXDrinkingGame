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
#import "UserModel.h"

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
    
    self.model = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dataFilePath]];
    
    if (!self.favoritesArray) {
        self.favoritesArray = [NSMutableArray new];
    }
    if (!self.model.favoritesArray) {
        self.model.favoritesArray = [NSMutableArray new];
    }
    
//    [self.favoritesArray addObject:[NSString stringWithFormat:@"test condition"]];
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


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.favoritesArray = self.model.favoritesArray;
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.favoritesArray) {
        return self.favoritesArray.count;
    } else {
        return 1;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.favoritesArray[indexPath.row];
    
    return cell;
}




@end
