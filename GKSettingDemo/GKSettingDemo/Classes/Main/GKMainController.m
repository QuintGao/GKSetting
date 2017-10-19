//
//  GKMainController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKMainController.h"
#import "GKTestViewController.h"
#import "GKWeChatViewController.h"

@interface GKMainController ()

@end

@implementation GKMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor redColor];
    
    [self addChildVC:[GKTestViewController new] title:@"测试" imageName:@"tab_home"];
    
    [self addChildVC:[GKWeChatViewController new] title:@"微信" imageName:@"tab_me"];
}

- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName {
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UINavigationController *nav = [UINavigationController rootVC:childVC translationScale:NO];
    
    [self addChildViewController:nav];
}



@end
