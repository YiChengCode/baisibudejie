//
//  YCTabBar.m
//  百思不得姐
//
//  Created by 廖易诚 on 2018/9/11.
//  Copyright © 2018年 liaoyicheng. All rights reserved.
//

#import "YCTabBar.h"

@interface YCTabBar ()

@property (nonatomic, weak) UIButton *publishBtn;

@end

@implementation YCTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIButton *publishBtn = [[UIButton alloc] init];
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.publishBtn.bounds = CGRectMake(0, 0, self.publishBtn.currentImage.size.width, self.publishBtn.currentImage.size.height);
    self.publishBtn.center = CGPointMake(self.gf_width * 0.5, self.gf_height * 0.5);
    
    
    CGFloat buttonY = 0;
    CGFloat buttonW =  self.gf_width / 5.0;
    CGFloat buttonH = self.gf_height;
    
    NSInteger index = 0;
    for (UIView *tempView in self.subviews) {
        
        if (![tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1) : index );
        tempView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index++;
    }
}

@end
