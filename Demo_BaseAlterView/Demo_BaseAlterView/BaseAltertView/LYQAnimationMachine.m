//
//  LYQAnimationMachine.m
//  Demo_AlertView
//
//  Created by a on 16/8/16.
//  Copyright © 2016年 liyunqi. All rights reserved.
//

#import "LYQAnimationMachine.h"

@interface LYQAnimationMachine ()<CAAnimationDelegate>
{
    DidStopAnimation _stopBlock;
}
@end

@implementation LYQAnimationMachine

- (CATransition*)animationWithType:(LYQAnimationType)lyqType
                      andDirection:(LYQAnimationDirection)directionType
                       andDuration:(float)durationNum
                   andDidStopBlock:(void (^)(void))stopBlock
{
    _stopBlock = stopBlock;
    CATransition* animation = [CATransition animation];
    animation.duration = durationNum;
    animation.delegate = self;
    animation.removedOnCompletion = YES;
    NSString* directionStr = @"";
    switch (directionType) {
        case LYQAnimationFromLeft:
            directionStr = kCATransitionFromLeft;
            break;
        case LYQAnimationFromRigth:
            directionStr = kCATransitionFromRight;
            break;
        case LYQAnimationFromTop:
            directionStr = kCATransitionFromTop;
            break;
        case LYQAnimationFromBottom:
            directionStr = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    animation.subtype = directionStr;
    NSString* typeStr = @"";
    
    switch (lyqType) {
        case cube:
            typeStr = @"cube";
            break;
        case suckEffect:
            typeStr = @"suckEffect";
            break;
        case oglFlip:
            typeStr = @"oglFlip";
            break;
        case rippleEffect:
            typeStr = @"rippleEffect";
            break;
        case pageCurl:
            typeStr = @"pageCurl";
            break;
        case pageUnCurl:
            typeStr = @"pageUnCurl";
            break;
        case cameralIrisHollowClose:
            typeStr = @"cameraIrisHollowOpen";
            break;
        case cameralIrisHollowOpen:
            typeStr = @"cameraIrisHollowClose";
            break;
        case fade:
            typeStr = kCATransitionFade;
            break;
        case push:
            typeStr = kCATransitionPush;
            break;
        case reveal:
            typeStr = kCATransitionReveal;
            break;
        case moveIn:
            typeStr = kCATransitionMoveIn;
            break;
        default:
            break;
    }
    animation.type = typeStr;
    return animation;
}

- (CAKeyframeAnimation*)alertAnimationWithDur:(CFTimeInterval)dur
                              andDidStopBlock:(void (^)(void))stopBlock
{
    CAKeyframeAnimation* animation;
    _stopBlock = stopBlock;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = dur;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray* values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    
    return animation;
}

- (void)animationDidStart:(CAAnimation*)anim
{
    
}
/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */
- (void)animationDidStop:(CAAnimation*)anim finished:(BOOL)flag
{
    _stopBlock();
}
@end
