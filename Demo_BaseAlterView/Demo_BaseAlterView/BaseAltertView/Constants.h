//
//  Constants.h
//  Demo_WeiBo
//
//  Created by a on 16/7/5.
//  Copyright © 2016年 liyunqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#define URL_BASE         @""

//判断系统
#define IOS5    [[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0
#define IOS6    [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0
#define IOS7    [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

//控件间距
#define margin 10;

//屏幕尺寸来判断手机型号
#define IPHONE5s        ([[UIScreen mainScreen] bounds].size.height == 568)
#define IPHONE4s        ([[UIScreen mainScreen] bounds].size.height == 480)
#define IPHONE6s        ([[UIScreen mainScreen] bounds].size.height == 960)
#define IPHONE6s_PLUS   ([[UIScreen mainScreen] bounds].size.height == 960)

//判断iPad还是iPhone
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//获取应用版本信息：
#define APP_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//聊天界面输入框所在的View高度
#define KEYBOARDVIEW_HEIGHT 60

//颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

//适配需要的宏
/**
 *	@brief 屏幕高
 */
#define SCREEN_HEIGH [UIScreen mainScreen].bounds.size.height
/**
 *	@brief 屏幕宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/**
 *	@brief 状态栏高
 */
#define STATUE_HEIGH [UIApplication sharedApplication].statusBarFrame.size.height
/**
 *	@brief NavigationBar高
 */
#define NAVIBAR_HEIGH 44

#define changeView_Height(tempView, pHeight)                                  \
[tempView                                                                 \
setFrame:CGRectMake(tempView.frame.origin.x, tempView.frame.origin.y, \
tempView.frame.size.width, pHeight)]