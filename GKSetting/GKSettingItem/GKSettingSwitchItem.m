//
//  GKSettingSwitchItem.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingSwitchItem.h"

@implementation GKSettingSwitchItem

- (void)setOpen:(BOOL)open {
    [GKSettingTool setBool:open forKey:self.key];
}

- (BOOL)open {
    return [GKSettingTool boolForKey:self.key];
}

- (void)setDefaultStatus:(BOOL)defaultStatus {
    _defaultStatus = defaultStatus;
    
    // 判断key属性是否设置
    NSAssert(self.key && ![self.key isEqualToString:@""], @"未设置key属性");
    
    NSString *isSettingKey = [self.key stringByAppendingString:@"_isSetting"];
    
    BOOL isSetting = [GKSettingTool boolForKey:isSettingKey];
    if (!isSetting) {
        [GKSettingTool setBool:YES forKey:isSettingKey];
        
        [GKSettingTool setBool:defaultStatus forKey:self.key];
    }
}

@end
