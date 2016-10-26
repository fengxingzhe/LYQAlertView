//
//  BaseAlert.m
//  Demo_AlertView
//
//  Created by a on 16/8/16.
//  Copyright © 2016年 liyunqi. All rights reserved.
//

#import "BaseAlert.h"
#import "LYQAnimationMachine.h"
#import "Constants.h"

@interface BaseAlert ()
@property (nonatomic, strong) LYQAnimationMachine *animationM;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) AnimationType animationType;
@property (nonatomic, weak) UIWindow* osWindow;
@end

@implementation BaseAlert

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _frame = frame;
        UIWindow* osWind = [UIApplication sharedApplication].keyWindow;
        _osWindow = osWind;
        _shadowView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGH)];
        [_shadowView setBackgroundColor:[UIColor whiteColor]];
        [_shadowView addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(tap)]];
        _shadowView.userInteractionEnabled = YES;
        _shadowView.hidden = YES;
        _animationM = [[LYQAnimationMachine alloc] init];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.cornerRadius = 5;
        self.center = osWind.center;
        self.userInteractionEnabled = YES;
        self.hidden = YES;
    }
    return self;
}
- (void)tap
{
    [self dismiss];
}
- (void)showWithAlert // alert弹出方式
{
    if (_fatherView == nil) {
        [self.osWindow addSubview:self.shadowView];
        [self.osWindow bringSubviewToFront:self.shadowView];
        [self.osWindow addSubview:self];
    }else{
        [self.fatherView addSubview:self.shadowView];
        [self.fatherView bringSubviewToFront:self.shadowView];
        [self.fatherView addSubview:self];
    }
    if (self.shadowView.hidden || self.hidden) {
        self.shadowView.hidden = NO;
        self.hidden = NO;
        self.animationType = AnimationTypeAlert;
        [self.layer addAnimation:[_animationM alertAnimationWithDur:0.5
                                                    andDidStopBlock:^{
//                                                        NSLog(@"showDidStopBlock");
                                                    }]
                          forKey:nil];
    }
}
//- (void)showWithDisplace:(CGPoint)newP
//             andDuration:(float)duration //位移
//{
//    if (_fatherView == nil) {
//        [self.osWindow addSubview:self.shadowView];
//        [self.osWindow bringSubviewToFront:self.shadowView];
//        [self.osWindow addSubview:self];
//    }else{
//        [self.fatherView addSubview:self.shadowView];
//        [self.fatherView bringSubviewToFront:self.shadowView];
//        [self.fatherView addSubview:self];
//    }
//    if (self.shadowView.hidden || self.hidden) {
//        self.shadowView.hidden = NO;
//        self.hidden = NO;
//        self.animationType = AnimationTypeDisplace;
//        __weak BaseAlert* weakSelf = self;
//        weakSelf.center = newP;
//    }
//}
//- (void)showWithAlphaDuration:(float)duration
//{
//    if (_fatherView == nil) {
//        [self.osWindow addSubview:self.shadowView];
//        [self.osWindow bringSubviewToFront:self.shadowView];
//        [self.osWindow addSubview:self];
//    }else{
//        [self.fatherView addSubview:self.shadowView];
//        [self.fatherView bringSubviewToFront:self.shadowView];
//        [self.fatherView addSubview:self];
//    }
//    if (self.shadowView.hidden || self.hidden) {
//        self.shadowView.hidden = NO;
//        self.hidden = NO;
//        self.alpha = 1.0;
//        self.animationType = AnimationTypeAlpha;
//        __weak BaseAlert* weakSelf = self;
//        [UIView animateWithDuration:duration
//                         animations:^{
//                             weakSelf.alpha = 1.0;
//                         }
//                         completion:^(BOOL finished){
//                             
//                         }];
//    }
//}
//- (void)showWithScaleTypeAndDuration:(float)duration
//{
//    if (_fatherView == nil) {
//        [self.osWindow addSubview:self.shadowView];
//        [self.osWindow bringSubviewToFront:self.shadowView];
//        [self.osWindow addSubview:self];
//    }else{
//        [self.fatherView addSubview:self.shadowView];
//        [self.fatherView bringSubviewToFront:self.shadowView];
//        [self.fatherView addSubview:self];
//    }
//    if (self.shadowView.hidden || self.hidden) {
//        self.shadowView.hidden = NO;
//        self.hidden = NO;
//        self.alpha = 1.0;
//        _animationType = AnimationTypeAlphaScaleBig;
//        float nowTempH = self.frame.size.height;
//        changeView_Height(self, 1);
//        [UIView animateWithDuration:duration
//                         animations:^{
//                             changeView_Height(self, nowTempH);
//                         }
//                         completion:^(BOOL finished){
//                             
//                         }];
//    }
//}

- (void)dismiss
{
    _fatherView = nil;
    _shadowView.hidden = YES;
    self.hidden = YES;
    if (_animationType == AnimationTypeAlpha) {
        self.alpha = 1;
    }
    else if (_animationType == AnimationTypeDisplace || _animationType == AnimationTypeAlphaScaleBig) {
        [self setFrame:_frame];
    }
    [self endEditing:YES];
}
@end
