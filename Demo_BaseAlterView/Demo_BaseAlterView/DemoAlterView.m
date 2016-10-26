//
//  DemoAlterView.m
//  Demo_BaseAlterView
//
//  Created by a on 2016/10/26.
//  Copyright © 2016年 liyunqi. All rights reserved.
//

#import "DemoAlterView.h"

@implementation DemoAlterView

+ (instancetype)shareDemoAlertWithFrame:(CGRect)frame
{
    static DemoAlterView* demoAlert = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        demoAlert = [[DemoAlterView alloc] initWithFrame:frame];
        demoAlert.backgroundColor = [UIColor whiteColor];
    });
    return demoAlert;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel * label = [[UILabel alloc]initWithFrame:self.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"测试";
        [self addSubview:label];
    }
    return self;
}

@end
