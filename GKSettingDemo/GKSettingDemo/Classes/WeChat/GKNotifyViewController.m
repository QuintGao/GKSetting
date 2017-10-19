//
//  GKNotifyViewController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/19.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKNotifyViewController.h"

@interface GKNotifyViewController ()

@end

@implementation GKNotifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"新消息通知";
    
    [self addFirstGroup];
    
    [self addSecondGroup];
    
    [self addThirdGroup];
    
    [self addFourGroup];
}

- (void)addFirstGroup {
    GKSettingSwitchItem *newMsgItem = [GKSettingSwitchItem itemWithText:@"接收新消息通知"];
    newMsgItem.key = @"NewMsg";
    newMsgItem.defaultStatus = YES;
    
    GKSettingSwitchItem *inviteItem = [GKSettingSwitchItem itemWithText:@"接收语音和视频聊天邀请通知"];
    inviteItem.key = @"invite";
    inviteItem.defaultStatus = YES;
    
    GKSettingSwitchItem * bellsItem = [GKSettingSwitchItem itemWithText:@"视频聊天、语音聊天铃声"];
    bellsItem.key = @"bells";
    bellsItem.defaultStatus = YES;
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.headerHeight = 15;
    group.footerHeight = 0;
    group.items = @[newMsgItem, inviteItem, bellsItem];

    [self.settingView.allGroups addObject:group];
}

- (void)addSecondGroup {
    GKSettingSwitchItem *detailItem = [GKSettingSwitchItem itemWithText:@"通知显示消息详情"];
    detailItem.key = @"detail";
    detailItem.defaultStatus = YES;
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.footer = @"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要";
    group.items = @[detailItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addThirdGroup {
    GKSettingArrowItem *funcItem = [GKSettingArrowItem itemWithText:@"功能消息免打扰"];
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.footer = @"设置系统功能消息提示声音和振动的时段";
    group.items = @[funcItem];
    
    [self.settingView.allGroups addObject:group];
}

- (void)addFourGroup {
    GKSettingSwitchItem *voiceItem = [GKSettingSwitchItem itemWithText:@"声音"];
    voiceItem.key = @"voice";
    voiceItem.defaultStatus = NO;
    
    GKSettingSwitchItem *vibrateItem = [GKSettingSwitchItem itemWithText:@"振动"];
    vibrateItem.key = @"vibrate";
    vibrateItem.defaultStatus = YES;
    
    GKSettingGroup *group = [GKSettingGroup new];
    group.footer = @"当微信在运行时，你可以设置是否需要声音或振动";
    group.items = @[voiceItem, vibrateItem];
    
    [self.settingView.allGroups addObject:group];
}

@end
