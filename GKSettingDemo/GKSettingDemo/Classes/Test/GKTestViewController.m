//
//  GKTestViewController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKTestViewController.h"
#import "GKSettingView.h"
#import "GKTool.h"

@interface GKTestViewController ()

@property (nonatomic, strong) GKSettingView *settingView;

@end

@implementation GKTestViewController

- (GKSettingView *)settingView {
    if (!_settingView) {
        _settingView = [[GKSettingView alloc] init];
    }
    return _settingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navBackgroundColor   = [UIColor blackColor];
    
    self.view.backgroundColor    = [UIColor whiteColor];
    
    self.gk_navigationItem.title = @"测试";
    
    [self.view addSubview:self.settingView];
    
    self.settingView.frame = CGRectMake(0, self.gk_navigationBar.bottom, self.view.width, self.view.height - self.gk_navigationBar.height - 49);
    
    [self addSettingIcon];
    
    [self addSettingArrow];
    
    [self addSettingSwitch];
    
    [self addSettingItem];
    
    [self addSettingExitItem];
    
    [self.settingView reloadData];
}

- (void)addSettingIcon {
    GKSettingIconItem *item1 = [GKSettingIconItem itemWithIcon:@"icon" text:@"用户名"];
    item1.detailStyle = GKSettingDetailStyleBottom;
    item1.detailText  = @"用户id：12345";
    item1.iconCornerRadius = 10;
    item1.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    item1.cellHeight = 100;
    item1.iconSize = CGSizeMake(80, 80);
    
    GKSettingIconItem *item2 = [GKSettingIconItem itemWithIcon:@"icon" text:@"用户名"];
    item2.hideArrow   = YES;
    item2.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    
    GKSettingIconItem *item3 = [GKSettingIconItem itemWithIcon:@"icon" text:nil];
    item3.iconStyle = GKSettingIconStyleCenter;
    item3.hideArrow = YES;
    item3.detailStyle = GKSettingDetailStyleRight;
    item3.detailText = @"修改头像";
    
    GKSettingIconItem *item4 = [GKSettingIconItem itemWithIcon:@"icon" text:@"用户名"];
    item4.iconStyle = GKSettingIconStyleRight;
    item4.iconSize = CGSizeMake(30, 30);
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.items = @[item1, item2, item3, item4];
    group.header = @"带icon的cell";
    group.footerHeight = 0;
    group.headerHeight = 30;
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSettingArrow {
    GKSettingArrowItem *item1 = [GKSettingArrowItem itemWithIcon:@"ic_album" text:@"带图标的cell"];
    item1.separatorAlignType = GKSettingCellSeparatorAlignTypeImage;
    
    GKSettingArrowItem *item2 = [GKSettingArrowItem itemWithText:@"不带图标的cell"];
    
    GKSettingArrowItem *item3 = [GKSettingArrowItem itemWithText:@"下边"];
    item3.detailStyle = GKSettingDetailStyleBottom;
    item3.detailText  = @"我显示在下边";
    
    GKSettingArrowItem *item4 = [GKSettingArrowItem itemWithText:@"中间"];
    item4.detailStyle = GKSettingDetailStyleCenter;
    item4.detailText  = @"我显示在中间";
    
    GKSettingArrowItem *item5 = [GKSettingArrowItem itemWithText:@"右边"];
    item5.detailStyle = GKSettingDetailStyleRight;
    item5.detailText  = @"我显示在右边";
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.header = @"带箭头的cell";
    group.items = @[item1, item2, item3, item4, item5];
    group.footerHeight = 0;
    group.headerHeight = 30;
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSettingSwitch {
    GKSettingSwitchItem *item1 = [GKSettingSwitchItem itemWithText:@"推送通知"];
    item1.key = @"notification";
    item1.defaultStatus = YES;
    
    item1.switchChangeBlock = ^(BOOL open) {
        if (open) {
            NSLog(@"通知打开");
        }else {
            NSLog(@"通知关闭");
        }
    };
    GKSettingGroup *group = [GKSettingGroup new];
    group.header = @"带开关的cell";
    group.items = @[item1];
    group.footerHeight = 0;
    group.headerHeight = 30;
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSettingItem {
    GKSettingItem *item1 = [GKSettingItem itemWithText:@"版本号"];
    item1.detailStyle = GKSettingDetailStyleRight;
    item1.detailText  = @"v3.0.0";
    
    GKSettingItem *item2 = [GKSettingItem itemWithText:@"版本更新"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.items = @[item1, item2];
    group.footerHeight = 0;
    group.headerHeight = 30;
    
    [self.settingView.allGroups addObject:group];
}

- (void)addSettingExitItem {
    GKSettingExitItem *item = [GKSettingExitItem itemWithText:@"退出登录"];
    item.textColor = [UIColor redColor];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.items = @[item];
    group.footerHeight = 0;
    group.headerHeight = 80;
    
    [self.settingView.allGroups addObject:group];
}

@end
