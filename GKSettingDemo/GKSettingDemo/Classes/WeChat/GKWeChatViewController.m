//
//  ViewController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/15.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWeChatViewController.h"
#import "GKSettingView.h"
#import "GKSettingArrowItem.h"
#import "GKPersonalViewController.h"
#import "GKSettingViewController.h"

@interface GKWeChatViewController ()

@end

@implementation GKWeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"WeChat";
    
    self.settingView.height -= 49;
    
    [self addIconGroup];
    
    [self addFirstGroup];
    [self addSecondGroup];
    [self addThirdGroup];
    
    [self.settingView reloadData];
}

- (void)addIconGroup {
    GKSettingIconItem *iconItem = [GKSettingIconItem itemWithIcon:@"icon" text:@"用户名"];
    iconItem.detailStyle      = GKSettingDetailStyleBottom;
    iconItem.detailText       = @"微信号：12345";
    iconItem.detailTextFont   = [UIFont systemFontOfSize:13];
    iconItem.detailTextColor  = [UIColor blackColor];
    iconItem.cellHeight       = 95;
    iconItem.iconSize         = CGSizeMake(70, 70);
    iconItem.iconCornerRadius = 5;
    iconItem.operation = ^{
        GKPersonalViewController *personalVC = [GKPersonalViewController new];
        personalVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:personalVC animated:YES];
    };
    
    GKSettingGroup *iconGroup = [GKSettingGroup new];
    iconGroup.items = @[iconItem];
    iconGroup.headerHeight = 15;
    iconGroup.footerHeight = 0;
    
    [self.settingView.allGroups addObject:iconGroup];
}

- (void)addFirstGroup {
    GKSettingArrowItem *bankItem = [GKSettingArrowItem itemWithIcon:@"ic_bankcard" text:@"钱包"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.items = @[bankItem];
    group.headerHeight = 20;
    group.footerHeight = 0;
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSecondGroup {
    GKSettingArrowItem *favorites = [GKSettingArrowItem itemWithIcon:@"ic_favorites" text:@"收藏"];
    favorites.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    
    GKSettingArrowItem *album = [GKSettingArrowItem itemWithIcon:@"ic_album" text:@"相册"];
    album.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    
    GKSettingArrowItem *card = [GKSettingArrowItem itemWithIcon:@"ic_cardpackage" text:@"卡包"];
    card.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    
    GKSettingArrowItem *express = [GKSettingArrowItem itemWithIcon:@"ic_expression" text:@"表情"];
    express.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.items = @[favorites, album, card, express];
    group.headerHeight = 20;
    group.footerHeight = 0;
    
    [self.settingView.allGroups addObject:group];
}

- (void)addThirdGroup {
    GKSettingArrowItem *setting = [GKSettingArrowItem itemWithIcon:@"ic_setting" text:@"设置"];
    setting.operation = ^{
        GKSettingViewController *settingVC = [GKSettingViewController new];
        settingVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:settingVC animated:YES];
    };
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.items = @[setting];
    group.headerHeight = 20;
    group.footerHeight = 0;
    
    [self.settingView.allGroups addObject:group];
}

@end
