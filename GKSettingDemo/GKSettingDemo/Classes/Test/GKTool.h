//
//  GKTool.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKTool : NSObject

+ (void)setNotificationOpen:(BOOL)open;

+ (BOOL)notificationOpen;

+ (void)setIsFirstLaunch:(BOOL)first;

+ (BOOL)isFirstLaunch;

@end
