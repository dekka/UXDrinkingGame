//
//  SearchView.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 1/14/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import "SearchView.h"

@interface SearchView () <UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate>

@end

@implementation SearchView 

- (id)initWithFrame:(CGRect)frame {
    self = [[[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:self options:nil] objectAtIndex:0];
    frame.origin.x = 0;
    frame.origin.y = 100;
    
    self.frame = frame;
    return self;
}



@end
