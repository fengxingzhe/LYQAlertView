//
//  LYQAnimationMachine.h
//  Demo_AlertView
//
//  Created by a on 16/8/16.
//  Copyright © 2016年 liyunqi动画基本类 Email:liyunqifengxingzhe@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

typedef enum AnimationType {
    cube = 1,                           //立方体效果
    suckEffect = 2,                     //收缩效果，如一块布被抽走
    oglFlip = 3,                        //上下翻转效果
    rippleEffect = 4,                   //滴水效果
    pageCurl = 5,                       //向上翻一页
    pageUnCurl = 6,                     //向下翻一页
    cameralIrisHollowOpen = 7,          //开镜头
    cameralIrisHollowClose = 8,         //关镜头
    fade = 9,                           //淡入淡出
    push = 10,                          //推挤
    reveal = 11,                        //揭开
    moveIn = 12,                        //覆盖
} LYQAnimationType;

typedef enum {
    LYQAnimationFromRigth = 1,          //从右侧出场
    LYQAnimationFromLeft = 2,           //从左侧出场
    LYQAnimationFromTop = 3,            //从上面出场
    LYQAnimationFromBottom = 4          //从底部出场
} LYQAnimationDirection;

typedef void (^DidStopAnimation)(void);

@interface LYQAnimationMachine : NSObject

/**
 *  @brief  创建CATransition动画类
 *
 *  @param  lyqType         动画效果，传枚举值LYQAnimationType
 *  @param  directionType   动画出场方向，传枚举值LYQAnimationDirection
 *  @param  durationNum     动画时间，float类型
 *  @param  stopBlock       动画结束后，执行block代码块
 *
 *  @return 返回CATransition动画类
 */
- (CATransition *)animationWithType:(LYQAnimationType)lyqType
                       andDirection:(LYQAnimationDirection)directionType
                        andDuration:(float)durationNum
                    andDidStopBlock:(void (^)(void))stopBlock;
/**
 *  @brief  获取CAKeyframeAnimation动画类
 *
 *  @param  dur             动画时间，CFTimeInterval
 *  @param  stopBlock       动画结束后，执行block代码块
 *
 *  @return 返回CAKeyframeAnimation动画类
 */
- (CAKeyframeAnimation *)alertAnimationWithDur:(CFTimeInterval)dur
                               andDidStopBlock:(void (^)(void))stopBlock;

@end
