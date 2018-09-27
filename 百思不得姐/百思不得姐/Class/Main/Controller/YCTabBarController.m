//
//  YCTabBarController.m
//  百思不得姐
//
//  Created by 廖易诚 on 17/6/15.
//  Copyright © 2017年 liaoyicheng. All rights reserved.
//

#import "YCTabBarController.h"

#import "YCNavigatioinController.h"
#import "YCEssenceViewController.h"
#import "YCNewViewController.h"
#import "YCFocusViewController.h"
#import "YCMeViewController.h"
#import "YCTabBar.h"

@interface YCTabBarController ()

@end

@implementation YCTabBarController

+ (void)initialize {
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UITabBar appearance] setTintColor:RGBAColor(51, 51, 51, 1)];
    [self addChildViewControllers];
}

- (void)addChildViewControllers {
    YCEssenceViewController *essenceVc = [[YCEssenceViewController alloc] init];
    [self addChildViewController:essenceVc title:@"精华" image:@"tabBar_essence"];
    
    YCNewViewController *newVc = [[YCNewViewController alloc] init];
    [self addChildViewController:newVc title:@"新帖" image:@"tabBar_new"];
    
    YCFocusViewController *focusVc = [[YCFocusViewController alloc] init];
    [self addChildViewController:focusVc title:@"关注" image:@"tabBar_friendTrends"];
    
    YCMeViewController *meVc = [[YCMeViewController alloc] init];
    [self addChildViewController:meVc title:@"我的" image:@"tabBar_me"];
    
    
    [self setValue:[[YCTabBar alloc] init] forKeyPath:@"tabBar"];

}

- (void)addChildViewController:(YCBaseViewController *)childController title:(NSString *)title image:(NSString *)imageName {
    
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_icon",imageName]];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_click_icon",imageName]];
    [childController setLeftBarButtonImage:@""];
    YCNavigatioinController *navVc = [[YCNavigatioinController alloc] initWithRootViewController:childController];;
    [self addChildViewController:navVc];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    int index = (int)[self.tabBar.items indexOfObject:item];

    NSMutableArray *items = [NSMutableArray array];
    for (UIView *tempView in self.tabBar.subviews) {
        
        if ([tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [items addObject:tempView];
        }
    }
    
    // 添加动画
    CABasicAnimation *scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    scaleAni.duration = 0.15;
    scaleAni.repeatCount = 1;
    scaleAni.autoreverses = YES;
    scaleAni.fromValue = @(1);
    scaleAni.toValue = @(1.2);
    [[items[index] layer] addAnimation:scaleAni forKey:nil];
}

@end
