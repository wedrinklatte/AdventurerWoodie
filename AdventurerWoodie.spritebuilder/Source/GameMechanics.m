//
//  GameMechanics.m
//  AdventurerWoodie
//
//  Created by Ding ZHAO on 3/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GameMechanics.h"
#import "WoodieWalkRight.h"
#import "Wood.h"

@implementation GameMechanics
- (void)initialize
{
    character = (WoodieWalkRight*)[CCBReader load:@"WoodieWalkRight"];
    character.scaleX = 0.2f;
    character.scaleY = 0.2f;
    character.position = ccp(_startStation.position.x, _startStation.position.y+80);
    [_woodContainer addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    //Increment the time since the last obstacle was added
    timeSinceObstacle += delta;
    
    //Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        //Add a new obstacle
        [self addObstacle];
        //Then reset the timer
        timeSinceObstacle = 0.0f;
        
    }
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // this will get called every time the player touches the screen
    //get the x,y coordinates of the touch
    CGPoint touchLocation = [touch locationInNode:self];
    //place the wood on the touch location
    Wood* wood= (Wood*)[CCBReader load:@"Wood"];
    wood.position = touchLocation;
    //add new wood to the parent physics node
    [_woodContainer addChild:wood];
    
}
@end
