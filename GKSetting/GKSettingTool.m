//
//  GKSettingTool.m
//  GKSettingDemo
//
//  Created by QuintGao on 2017/10/20.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#define GKUserDefault [NSUserDefaults standardUserDefaults]

#import "GKSettingTool.h"

@implementation GKSettingTool

+ (id)objectForKey:(NSString *)key {
    return [GKUserDefault objectForKey:key];
}

+ (void)setObject:(id)value forKey:(NSString *)key {
    [GKUserDefault setObject:value forKey:key];
    [GKUserDefault synchronize];
}

+ (BOOL)boolForKey:(NSString *)key {
    return [GKUserDefault boolForKey:key];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)key {
    [GKUserDefault setBool:value forKey:key];
    [GKUserDefault synchronize];
}

@end
