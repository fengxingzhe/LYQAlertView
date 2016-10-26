//
//  ViewController.m
//  Demo_BaseAlterView
//
//  Created by a on 2016/10/26.
//  Copyright © 2016年 liyunqi. All rights reserved.
//

#import "ViewController.h"
#import "DemoAlterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * demoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    demoBtn.frame = CGRectMake(100, 100, 100, 100);
    [demoBtn setTitle:@"点击" forState:UIControlStateNormal];
    [demoBtn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:demoBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) clickAction
{
    DemoAlterView* alterView = [DemoAlterView shareDemoAlertWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 100, (CGRectGetWidth([UIScreen mainScreen].bounds) - 100) * 9 / 16)];
    alterView.shadowView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [alterView showWithAlert];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


@end
