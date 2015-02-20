//
//  HomeViewController.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 12/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchView.h"
#import "UXDWebService.h"
#import "DrinkEvent.h"
#import "FavoritesViewController.h"
#import "UserModel.h"
#import "TabBarViewController.h"
#import <RestKit/RestKit.h>
#import <Foundation/Foundation.h>

@interface HomeViewController () <UIGestureRecognizerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) SearchView *searchView;
@property (nonatomic, weak) NSString *drinkString;
@property (nonatomic, strong) NSURLSession *urlSession;
@property (nonatomic, strong) NSMutableArray *drinkResults;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, retain) UISearchBar *mySearchBar;
@property (nonatomic, retain) FavoritesViewController *favoritesVC;

@end

@implementation HomeViewController

#define UX_DRINKING_GAME_API_URL @"http://www.uxdrinkinggame.com/Webservice/"

- (id)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UX Drinking Game";
    
//    [[[UXDWebService sharedInstance] manager] getObjectsAtPath:@"viewItemListNew.php?test=999" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
//        //success
//        self.drinkResults = mappingResult.array;
//        [self returnNewCondition];
//    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//        //NSLog(error.localizedDescription);
//    }];
    [self refreshDrinkResults];
    
    TabBarViewController *tabBarVC = (TabBarViewController *)self.tabBarController;
    self.model = tabBarVC.userModel;
    
    
    if (!self.model.favoritesArray) {
        self.model.favoritesArray = [NSMutableArray new];
    }
    
    [self setupGestureRecognizer];
    
}

- (void)refreshDrinkResults {
    [[[UXDWebService sharedInstance] manager] getObjectsAtPath:@"viewItemListNew.php?test=999" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        //success
        self.drinkResults = mappingResult.array;
        [self returnNewCondition];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        //NSLog(error.localizedDescription);
    }];
}

- (IBAction)refreshDrinksButton:(id)sender {
    [self refreshDrinkResults];
}

- (void)setupGestureRecognizer {
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:swipeRecognizer];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {
    [self returnNewCondition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSearch:(id)sender {
//    self.searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, 400)];
//    [self.view addSubview:self.searchView];
    if (!self.mySearchBar) {
        self.mySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 22, self.view.frame.size.width, 55)];
        [self.mySearchBar setShowsCancelButton:YES animated:YES];
        [self.view addSubview:self.mySearchBar];
        self.mySearchBar.delegate = self;
        self.navigationController.navigationBarHidden = YES;
    } else {
        self.mySearchBar.alpha = 1.0;
        self.navigationController.navigationBarHidden = YES;
    }
    [self.mySearchBar becomeFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.navigationController.navigationBarHidden = NO;
    self.mySearchBar.alpha = 0.0;
    [self.mySearchBar resignFirstResponder];
}

- (void)conditionsForSearchString:(NSString *)searchString
{
//    searchString = [searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSURL *jsonURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.uxdrinkinggame.com/Webservice/pg-list-search.php?search=%@", searchString]];
//    
//    NSData *jsonData = [NSData dataWithContentsOfURL:jsonURL];
//    
//    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                                    options:NSJSONReadingMutableContainers
//                                                                      error:nil];
//    
//    NSMutableArray *tempArray = [jsonDict objectForKey:@"items"];
//    
//    
//    for (NSDictionary *tempDict in tempArray) {
//        DrinkEvent *event = [DrinkEvent new];
//        event.content = [tempDict objectForKey:@"content"];
//        [self.searchResults addObject:event];
//    }
//    [self.searchView reloadInputViews];
    
    [[[UXDWebService sharedInstance] manager] getObjectsAtPath:[NSString stringWithFormat:@"http://www.uxdrinkinggame.com/Webservice/pg-list-search.php?search=%@", searchString] parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        //success
        self.searchResults = mappingResult.array;
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        //failure
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    searchBar = self.mySearchBar;
    [searchBar resignFirstResponder];
    [self.searchResults removeAllObjects];
    
    [self conditionsForSearchString:searchBar.text];
    
    [self.searchView reloadInputViews];
}

- (IBAction)newCondition:(id)sender {
    
    [self returnNewCondition];
    
}

- (void)returnNewCondition {
    NSUInteger j = arc4random_uniform((u_int32_t)self.drinkResults.count);
    
    DrinkEvent *drink = [self.drinkResults objectAtIndex:j];
    [self.drinkTextView setText:drink.content];
    self.model.drinkCondition = drink.content;
}

- (IBAction)addToFavorites:(id)sender {
    [self.model.favoritesArray addObject:self.model.drinkCondition];
    [self.model saveFavoritesArray];
    
    /* what about adding to self.favoritesVC.favoritesArray directly from here? */
}



@end
