//
//  YCBaseViewController.m
//  百思不得姐
//
//  Created by 廖易诚 on 17/6/15.
//  Copyright © 2017年 liaoyicheng. All rights reserved.
//

#import "YCBaseViewController.h"

@interface YCBaseViewController ()

@end

@implementation YCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - setupui
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setLeftBarButtonImage:@"navigationButtonReturn"];
    [self.navigationController.navigationBar setBackgroundColor:RGBAColor(246, 246, 246,1)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSForegroundColorAttributeName:RGBAColor(51, 51, 51, 1)
                                                                      }];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
                                                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                                     NSForegroundColorAttributeName:RGBAColor(51, 51, 51, 1)
                                                                     } forState:UIControlStateNormal];
    
    
}

#pragma mark - 左边导航栏按钮点击事件
- (void)leftBarButtonClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 右边导航栏按钮点击事件
- (void)rightBarButtonClick {
    
}

- (void)setLeftBarButtonTitle:(NSString *)title {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:0 target:self action:@selector(leftBarButtonClick)];
}
- (void)setRightBarButtonTitle:(NSString *)title {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:0 target:self action:@selector(rightBarButtonClick)];
}

- (void)setLeftBarButtonImage:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:0 target:self action:@selector(leftBarButtonClick)];
}
- (void)setRightBarButtonImage:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:0 target:self action:@selector(rightBarButtonClick)];
}

- (void)setLeftBarButtonHidden:(BOOL)hidden {
    [self.navigationItem.leftBarButtonItem setAccessibilityElementsHidden:YES];
}
- (void)setRightBarButtonHidden:(BOOL)hidden {
    [self.navigationItem.rightBarButtonItem setAccessibilityElementsHidden:YES];
}


/// 设置自定义titleView
- (void)setCustomTitleView:(UIView *)titleView {
    self.navigationItem.titleView = titleView;
}

#pragma mark - 设置titleView的内容、字体大小、颜色
- (void)setTitle:(NSString *)title font:(CGFloat)font textColor:(UIColor *)color {
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textColor = color;
    titleLabel.font = [UIFont systemFontOfSize:font];
    titleLabel.gf_x = 0;
    titleLabel.gf_y = 0;
    [titleLabel sizeToFit];
    [self setCustomTitleView:titleLabel];
    
}


@end
