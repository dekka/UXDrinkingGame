//
//  UXDWebService.m
//  UXDrinkingGame
//
//  Created by Reed Sweeney on 2/4/15.
//  Copyright (c) 2015 Reed Sweeney. All rights reserved.
//

#import "UXDWebService.h"
#import <RestKit/RestKit.h>
#import "DrinkEvent.h"

@implementation UXDWebService


+ (id)sharedInstance {
    static dispatch_once_t pred = 0;
    static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self.manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://www.uxdrinkinggame.com/Webservice/"]];
        
        [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/html"];
        
        NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
        
        RKResponseDescriptor *responseItemListNewDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[DrinkEvent responseMappingForGet]
                                                                                                           method:RKRequestMethodAny
                                                                                                      pathPattern:@"viewItemListNew.php"
                                                                                                          keyPath:nil
                                                                                                      statusCodes:statusCodes];
        [self.manager addResponseDescriptor:responseItemListNewDescriptor];
        
        RKResponseDescriptor *responseSearchItemListDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[DrinkEvent responseMappingForGet]
                                                                                                              method:RKRequestMethodAny
                                                                                                         pathPattern:@"searchItemList.php"
                                                                                                             keyPath:nil
                                                                                                         statusCodes:statusCodes];
        [self.manager addResponseDescriptor:responseSearchItemListDescriptor];
        
    }
    return self;
}


@end
