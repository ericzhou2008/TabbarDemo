//
//  YWXTabBarVC.m
//  TabbarDemo
//
//  Created by mygame on 15/8/7.
//  Copyright (c) 2015年 mygame. All rights reserved.
//

#import "YWXTabBarVC.h"
#import "ThreeViewController.h"

#define YWXColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:1.0]

@interface YWXTabBarVC ()<UITabBarDelegate, UITabBarControllerDelegate>

@end

@implementation YWXTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
#if 1
    // 设置不规则tabbar背景图片
    NSString *imageName = nil;
    if (CGRectGetWidth([UIScreen mainScreen].bounds) == 320) {
        imageName = @"Icon_BG0"; // 3.5、4.0寸屏幕
    }
    else if (CGRectGetWidth([UIScreen mainScreen].bounds) == 375) {
        imageName = @"Icon_BG1"; // 4.7寸屏幕
    }
    else if (CGRectGetWidth([UIScreen mainScreen].bounds) == 414) {
        imageName = @"Icon_BG2"; // 5.5寸屏幕
    }
    else {
        imageName = @"Icon_BG";
    }
    NSLog(@"imageName=%@", imageName);
    [self.tabBar setBackgroundImage:[UIImage imageNamed:imageName]];
    [self.tabBar setShadowImage:[[UIImage alloc] init]]; // 去掉原生49像素（物理）处的横线
#endif
    NSArray *titles = @[@"有我", @"消息", @"", @"广场", @"我"];
    NSArray *images = @[@"Icon_Home", @"Icon_Information", @"Icon_Order", @"Icon_Square", @"Icon_Presonal"];
    NSArray *imagesClicked = @[@"Icon_Home_Clicked", @"Icon_Information_Clicked", @"Icon_Order", @"Icon_Square_Clicked", @"Icon_Presonal_Clicked"];
    for (NSUInteger i = 0 < 0; i < images.count; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        
        UIImage* imageNormal = [UIImage imageNamed:images[i]];
        UIImage* imageSelected = [UIImage imageNamed:imagesClicked[i]];
        item.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.title = titles[i];
        if (i == 2) {
            item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        }
    
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : YWXColorFromRGB(0x999999)} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : YWXColorFromRGB(0x00bf8b)} forState:UIControlStateSelected];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////设置tabbaritem的样式及图片和文字
//- (void)setTabBarItemStyle:(UITabBarItem *)tabBarItem
//                     title:(NSString *)title
//                 imageName:(NSString *)name
//{
//    tabBarItem.title = title;
//    UIImage* imageNormal = [UIImage imageNamed:name];
//    UIImage* imageSelected = [UIImage imageNamed:[name stringByAppendingString:@"HL"]];
//    tabBarItem.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    tabBarItem.image = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [self setTabBarItemTitleColor:tabBarItem];
//}

////设置tabBarItem的文本样式及与图片的间距
//- (void)setTabBarItemTitleColor:(UITabBarItem *)tabBarItem
//{
//    UIColor *colorSelect = kGreenColor;
//    UIColor *color = kGetColor(121, 124, 129);
//    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                        color, NSForegroundColorAttributeName,[UIFont systemFontOfSize:10], NSFontAttributeName,
//                                        nil] forState:UIControlStateNormal];
//    
//    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                        colorSelect, NSForegroundColorAttributeName,[UIFont systemFontOfSize:10], NSFontAttributeName,
//                                        nil] forState:UIControlStateSelected];
//    tabBarItem.titlePositionAdjustment = UIOffsetMake(tabBarItem.titlePositionAdjustment.horizontal, (tabBarItem.titlePositionAdjustment.vertical - 3));
//}


//重写父类方法来拦截tabBar的点击选择事件
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isMemberOfClass:[ThreeViewController class]]) {
        NSLog(@"中间的按钮");
        return NO;
    }
    return YES;
}

@end
