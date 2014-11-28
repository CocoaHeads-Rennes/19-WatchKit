//
//  InterfaceController.m
//  HelloWatch WatchKit Extension
//
//  Created by Jean-Luc on 27/11/2014.
//  Copyright (c) 2014 Jean-Luc Jumpertz. All rights reserved.
//

#import "MainInterfaceController.h"


@interface MainInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceGroup *displayGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *name;

@property NSArray* characters;
@property NSInteger displayIndex;

@end


@implementation MainInterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        self.characters = @[ @{ @"name":@"Gaétan",
                                @"photo": @"elephant",
                                @"description": @"Gaétan est un éléphant.\nL'éléphant est symbole de sagesse dans la culture asiatique, connu pour sa mémoire et son intelligence, qui est comparée à celle des cétacés et hominidés. Aristote avait dit que l'éléphant est « la bête qui dépasse toutes les autres par l'intelligence et l'esprit."},
                             
                             @{ @"name":@"Tino",
                                @"photo": @"hippo",
                                @"description": @"Tino est un hippopotame.\nSes narines peuvent se refermer par contraction, et leurs conduits auditifs se bouchent lorsqu'ils plongent, ce qui s'avère très pratique dans leur mode de vie amphibie puisqu'ils peuvent ainsi éviter l'entrée d'eau dans leurs poumons lorsqu'ils se déplacent sous l'eau."},
                             
                             @{ @"name":@"Léon",
                                @"photo": @"pig",
                                @"description": @"Léon est un cochon.\nEn Océanie, le cochon est souvent associé à des pratiques culturelles et artistiques. Le championnat de France d'imitation du cri de cochon est organisé annuellement à Trie-sur-Baïse (Hautes-Pyrénées)."},
                             
                             @{ @"name":@"Zéphirin",
                                @"photo": @"penguin",
                                @"description": @"Zéphirin est un pingouin.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."},
                             
                             @{ @"name":@"Rémi",
                                @"photo": @"zebra",
                                @"description": @"Rémi est un zèbre.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."},
                             
                             @{ @"name":@"Linda",
                                @"photo": @"goat",
                                @"description": @"Linda est une chèvre.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."},
                             ];
        self.displayIndex = 0;
        
        [self displayCharacter];
        
    }
    return self;
}

- (void) displayCharacter
{
    NSDictionary* currentCharacter = self.characters[self.displayIndex];
    [self.name setText:currentCharacter[@"name"]];
    [self.displayGroup setBackgroundImage:[UIImage imageNamed:currentCharacter[@"photo"]]];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

- (IBAction)gotoPrevious {
    self.displayIndex -= 1;
    if (self.displayIndex < 0) {
        self.displayIndex = self.characters.count - 1;
    }
    [self displayCharacter];

}

- (IBAction)gotoNext {
    self.displayIndex += 1;
    if (self.displayIndex >= self.characters.count) {
        self.displayIndex = 0;
    }
    [self displayCharacter];

}
- (IBAction)pushDetailController {
    [self pushControllerWithName:@"detail controller" context:self.characters[self.displayIndex]];
}
- (IBAction)presentModalControllers {
    [self presentControllerWithNames:@[@"animation controller", @"ugly checked icon"] contexts:nil];
}

- (IBAction)share {
    NSLog(@"Share pressed");
}

- (IBAction)delete {
    NSMutableArray* characters = [self.characters mutableCopy];
    [characters removeObjectAtIndex:self.displayIndex];
    self.characters = [characters copy];
    if (self.displayIndex >= characters.count)
    {
        self.displayIndex = characters.count - 1;
    }
    [self displayCharacter];
}
@end



