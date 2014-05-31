//
//  LAGameOver.m
//  Leet Game
//
//  Created by Wayne Knoesen on 31/05/14.
//  Copyright (c) 2014 Wayne Knoesen. All rights reserved.
//


#import "LAGameOver.h"
#import "LAMyScene.h"

@implementation LAGameOver

-(id)initWithSize:(CGSize)size won:(BOOL)won {
    if (self = [super initWithSize:size]) {
    
    //1
    self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    //2
    NSString *message;
    if (won) {
        message = @"You Won!";
    }else {
        message = @"You Loose :[";
    }
    
    SKLabelNode *lable = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    lable.text = message;
    lable.fontSize = 40;
    lable.fontColor = [SKColor blackColor];
    lable.position = CGPointMake(self.size.width/2, self.size.height/2);
    [self addChild:lable];
    
    // 4
    [self runAction:
     [SKAction sequence:@[
                          [SKAction waitForDuration:3.0],
                          [SKAction runBlock:^{
                            // 5
                            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                            SKScene * myScene = [[LAMyScene alloc] initWithSize:self.size];
                            [self.view presentScene:myScene transition: reveal];
                            }]
                          ]]
                        ];
    
                    }   return self;
}

@end
