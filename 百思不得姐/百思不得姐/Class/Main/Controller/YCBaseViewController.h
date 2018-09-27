//
//  YCBaseViewController.h
//  百思不得姐
//
//  Created by 廖易诚 on 17/6/15.
//  Copyright © 2017年 liaoyicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCBaseViewController : UIViewController

/// 设置导航栏左右标题
- (void)setLeftBarButtonTitle:(NSString *)title;
- (void)setRightBarButtonTitle:(NSString *)title;

/// 设置导航栏左右图片
- (void)setLeftBarButtonImage:(NSString *)imageName;
- (void)setRightBarButtonImage:(NSString *)imageName;

/// 左右导航栏按钮的点击事件
- (void)leftBarButtonClick;
- (void)rightBarButtonClick;

- (void)setCustomTitleView:(UIView *)titleView;
- (void)setTitle:(NSString *)title font:(CGFloat)font textColor:(UIColor *)color;

- (void)setLeftBarButtonHidden:(BOOL)hidden;
- (void)setRightBarButtonHidden:(BOOL)hidden;
@end
