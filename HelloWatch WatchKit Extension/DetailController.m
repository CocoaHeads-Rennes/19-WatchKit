//
//  DetailController.m
//  HelloWatch
//
//  Created by Jean-Luc on 27/11/2014.
//  Copyright (c) 2014 Jean-Luc Jumpertz. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *name;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *descriptionText;

@end

@implementation DetailController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        NSDictionary* characterInfo = context;
        
        [self.name setText:characterInfo[@"name"]];
        [self.image setImage:[UIImage imageNamed:characterInfo[@"photo"]]];
        [self.descriptionText setText:characterInfo[@"description"]];

    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end