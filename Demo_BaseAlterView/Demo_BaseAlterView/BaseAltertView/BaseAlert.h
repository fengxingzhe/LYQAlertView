//
//  BaseAlert.h
//  Demo_AlertView
//
//  Created by a on 16/8/16.
//  Copyright © 2016年 liyunqi . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AnimationTypeAlert = 11,   // alert
    AnimationTypeAlpha,        //透明度
    AnimationTypeDisplace,     //位移
    AnimationTypeAlphaScaleBig //放大
} AnimationType;

@interface BaseAlert : UIImageView
// 自定义将alertView放在哪个View上，如果想放到keyWindow上，可以不设置
@property (nonatomic, weak) UIView* fatherView;
// 自定义alertView后面的半透明背景
@property (nonatomic, strong) UIImageView *shadowView;
/**
 *  @brief  alert弹出方式
 */
- (void)showWithAlert; 
/**
 *  @brief alterView消失
 */
- (void)dismiss;

@end
