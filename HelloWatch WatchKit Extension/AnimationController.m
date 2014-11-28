//
//  AnimationController.m
//  HelloWatch
//
//  Created by Jean-Luc on 28/11/2014.
//  Copyright (c) 2014 Jean-Luc Jumpertz. All rights reserved.
//

#import "AnimationController.h"

@interface AnimationController ()

@property (weak, nonatomic) IBOutlet WKInterfaceImage *animatedImage;
@property double currentSpeed;

@end

@implementation AnimationController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        self.currentSpeed = 1.0;
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

- (IBAction)playAnimation {
    [self.animatedImage startAnimatingWithImagesInRange:NSMakeRange(0, 10) duration:1 / self.currentSpeed repeatCount:20];
}

- (IBAction)pauseAnimation {
    [self.animatedImage stopAnimating];
}

- (IBAction)increaseSpeed {
    self.currentSpeed *= 1.5;
    [self playAnimation];
}

- (IBAction)decreaseSpeed {
    self.currentSpeed /= 1.5;
    [self playAnimation];
}

@end