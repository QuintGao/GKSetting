//
//  GKTool.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKTool.h"

#define kUserDefaults [NSUserDefaults standardUserDefaults]

@implementation GKTool

+ (void)setNotificationOpen:(BOOL)open {
    [kUserDefaults setBool:open forKey:@"notification"];
}

+ (BOOL)notificationOpen {
    return [kUserDefaults boolForKey:@"notification"];
}

+ (void)setIsFirstLaunch:(BOOL)first {
    [kUserDefaults setBool:first forKey:@"isFirstLaunch"];
}

+ (BOOL)isFirstLaunch {
    return[kUserDefaults boolForKey:@"isFirstLaunch"];
}

@end
