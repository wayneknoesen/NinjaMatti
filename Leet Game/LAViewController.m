//
//  LAViewController.m
//  Leet Game
//
//  Created by Wayne Knoesen on 30/05/14.
//  Copyright (c) 2014 Wayne Knoesen. All rights reserved.
//

#import "LAViewController.h"
#import "LAMyScene.h"
@import AVFoundation;

@interface LAViewController ()
@property (nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@end

@implementation LAViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    // Configure the view.
//    SKView * skView = (SKView *)self.view;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
//    
//    // Create and configure the scene.
//    SKScene * scene = [LAMyScene sceneWithSize:skView.bounds.size];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    
//    // Present the scene.
//    [skView presentScene:scene];
//}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSError *error;
    NSURL *backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"background-music-aac" withExtension:@"caf"];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    self.backgroundMusicPlayer.numberOfLoops = -1;
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    
    
    //Configure the view
    SKView *skView = (SKView *)self.view;
    if (!skView.scene) {
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
    //Create and Configure the scene
        SKScene *scene = [LAMyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
    
    //Present the view
        [skView presentScene:scene];
        
    }
    
    
}





- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
