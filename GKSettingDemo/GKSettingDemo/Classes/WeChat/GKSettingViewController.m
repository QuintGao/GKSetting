//
//  GKSettingViewController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/19.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingViewController.h"
#import "GKSettingView.h"
#import "GKNotifyViewController.h"

@interface GKSettingViewController ()

@end

@implementation GKSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"设置";
    
    [self addFirstGroup];
    [self addSecondGroup];
    [self addThirdGroup];
    [self addFourGroup];
    [self addExitGroup];
}

- (void)addFirstGroup {
    GKSettingArrowItem *numAndSafeItem = [GKSettingArrowItem itemWithText:@"账号与安全"];
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 15;
    group.footerHeight = 0;
    group.items = @[numAndSafeItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSecondGroup {
    GKSettingArrowItem *notifyItem = [GKSettingArrowItem itemWithText:@"新消息通知"];
    notifyItem.operation = ^{
        [self.navigationController pushViewController:[GKNotifyViewController new] animated:YES];
    };
    
    GKSettingArrowItem *privacyItem = [GKSettingArrowItem itemWithText:@"隐私"];
    
    GKSettingArrowItem *commonItem = [GKSettingArrowItem itemWithText:@"通用"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 20;
    group.footerHeight = 0;
    group.items = @[notifyItem, privacyItem, commonItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addThirdGroup {
    GKSettingArrowItem *helpItem = [GKSettingArrowItem itemWithText:@"帮助与反馈"];
    
    GKSettingArrowItem *aboutItem = [GKSettingArrowItem itemWithText:@"帮助"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 20;
    group.footerHeight = 0;
    group.items = @[helpItem, aboutItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addFourGroup {
    GKSettingIconItem *iconItem = [GKSettingIconItem itemWithIcon:@"ic_setting" text:@"插件"];
    iconItem.iconStyle = GKSettingIconStyleCenter;
    iconItem.iconSize = CGSizeMake(16, 16);
    iconItem.cellHeight = 44;
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 20;
    group.footerHeight = 0;
    group.items = @[iconItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addExitGroup {
    GKSettingExitItem *exitItem = [GKSettingExitItem itemWithText:@"退出登录"];
    exitItem.textColor = [UIColor blackColor];
    exitItem.operation = ^{
        NSLog(@"退出登录");
    };
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 20;
    group.footerHeight = 0;
    group.items = @[exitItem];
    
    [self.settingView.allGroups addObject:group];
}



@end
