//
//  GKSettingItem.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/15.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingItem.h"

@implementation GKSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon text:(NSString *)text {
    return [[self alloc] initWithIcon:icon text:text];
}

+ (instancetype)itemWithText:(NSString *)text {
    return [[self alloc] initWithIcon:nil text:text];
}

- (instancetype)initWithIcon:(NSString *)icon text:(NSString *)text {
    
    self.icon = icon;
    self.text = text;
    
    return [self init];
}

- (instancetype)init {
    if (self = [super init]) {
        self.cellHeight = 44;
        self.textSpace  = 15;
    }
    return self;
}

@end
