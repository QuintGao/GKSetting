//
//  GKSettingSwitchItem.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingSwitchItem.h"

#define GKUserDefault [NSUserDefaults standardUserDefaults]

@implementation GKSettingSwitchItem

- (void)setOpen:(BOOL)open {
    [GKUserDefault setBool:open forKey:self.key];
}

- (BOOL)open {
    return [GKUserDefault boolForKey:self.key];
}

- (void)setDefaultStatus:(BOOL)defaultStatus {
    _defaultStatus = defaultStatus;
    
    // 判断key属性是否设置
    NSAssert(self.key && ![self.key isEqualToString:@""], @"未设置key属性");
    
    NSString *isSettingKey = [self.key stringByAppendingString:@"_isSetting"];
    
    BOOL isSetting = [GKUserDefault boolForKey:isSettingKey];
    if (!isSetting) {
        [GKUserDefault setBool:YES forKey:isSettingKey];
        
        [GKUserDefault setBool:defaultStatus forKey:self.key];
    }
}

@end
