
//
//  YCEssenceViewController.m
//  百思不得姐
//
//  Created by 廖易诚 on 17/6/15.
//  Copyright © 2017年 liaoyicheng. All rights reserved.
//

#import "YCEssenceViewController.h"

@interface YCEssenceViewController ()

///
@property (nonatomic, weak) UIButton *selectedButton;
///
@property (nonatomic, weak) UIView *bottomLine;
///
@property (nonatomic, weak) UIView *menuView;

@end

@implementation YCEssenceViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.bottomLine.gf_x = self.selectedButton.titleLabel.gf_x + self.selectedButton.tag * self.selectedButton.gf_width;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagBtn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [tagBtn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tagBtn];
    
    [self adjustView];
    
}

- (void)adjustView {
    
//    [self setLeftBarButtonImage:@""];
    
    UIView *menuView = [[UIView alloc] init];
    menuView.gf_x = 0;
    menuView.gf_y = 64;
    menuView.gf_width = self.view.gf_width;
    menuView.gf_height = 50;
    [self.view addSubview:menuView];
    self.menuView = menuView;
    menuView.backgroundColor = RGBAColor(246, 246, 246, 1);
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    
    CGFloat width = YCScreenWidth / titles.count;
    CGFloat height = menuView.gf_height;
    
    for (int i = 0;i < titles.count;i++) {
        NSString *title = titles[i];
        UIButton *button = [[UIButton alloc] init];
        [menuView addSubview:button];
        button.frame = CGRectMake(i*width, 0, width, height);
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateSelected];
        [button setTitleColor:RGBAColor(51, 51, 51, 1) forState:UIControlStateNormal];
        [button setTitleColor:RGBAColor(255, 0, 0, 1) forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = i;
        [button addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    
}

- (void)menuBtnClick:(UIButton *)button {
    
    if (button.tag == self.selectedButton.tag) {
        return;
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomLine.gf_x = button.titleLabel.gf_x + button.tag * button.gf_width;
    }];
    
    
}


@end
