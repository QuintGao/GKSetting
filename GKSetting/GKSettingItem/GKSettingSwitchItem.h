//
//  GKSettingSwitchItem.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingItem.h"

@interface GKSettingSwitchItem : GKSettingItem

/** 是否打开，默认是NO */
@property (nonatomic, assign) BOOL open;

/** 开关的默认状态，必须在设置了key之后再设置 */
@property (nonatomic, assign) BOOL defaultStatus;

/** 开关控件对应的key，必须设置,且不同cell的key值不可一样 */
@property (nonatomic, strong) NSString *key;

@property (nonatomic, copy) void(^switchChangeBlock)(BOOL open);

@end
