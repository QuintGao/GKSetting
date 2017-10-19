//
//  GKPersonalViewController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/19.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKPersonalViewController.h"
#import "GKSettingView.h"

@interface GKPersonalViewController ()

@end

@implementation GKPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"个人信息";
    
    [self addFirstGroup];
    [self addSecondGroup];
}

- (void)addFirstGroup {
    GKSettingIconItem *iconItem = [GKSettingIconItem itemWithIcon:@"icon" text:@"头像"];
    iconItem.iconStyle  = GKSettingIconStyleRight;
    iconItem.cellHeight = 95;
    iconItem.iconSize   = CGSizeMake(70, 70);
    iconItem.iconCornerRadius = 5;
    
    GKSettingArrowItem *nameItem = [GKSettingArrowItem itemWithText:@"姓名"];
    nameItem.detailStyle = GKSettingDetailStyleRight;
    nameItem.detailText = @"微信号";
    nameItem.detailTextFont = [UIFont systemFontOfSize:15];
    
    GKSettingArrowItem *numberItem = [GKSettingArrowItem itemWithText:@"微信号"];
    numberItem.detailStyle    = GKSettingDetailStyleRight;
    numberItem.detailText     = @"12345";
    numberItem.detailTextFont = [UIFont systemFontOfSize:15];
    numberItem.hideArrow      = YES;
    
    GKSettingArrowItem *codeItem = [GKSettingArrowItem itemWithText:@"我的二维码"];
    
    GKSettingArrowItem *moreItem = [GKSettingArrowItem itemWithText:@"更多"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 15;
    group.footerHeight = 0;
    group.items = @[iconItem, nameItem, numberItem, codeItem, moreItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSecondGroup {
    GKSettingArrowItem *addrItem = [GKSettingArrowItem itemWithText:@"我的地址"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 20;
    group.footerHeight = 0;
    group.items = @[addrItem];
    
    [self.settingView.allGroups addObject:group];
}


@end
