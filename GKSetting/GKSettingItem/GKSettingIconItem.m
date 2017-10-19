//
//  GKSettingIconItem.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/18.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingIconItem.h"

@implementation GKSettingIconItem

- (instancetype)init {
    if (self = [super init]) {
        self.cellHeight       = 80;
        self.iconSize         = CGSizeMake(60, 60);
        self.iconCornerRadius = self.iconSize.width * 0.5;
        self.iconBorderColor  = [UIColor blackColor];
        self.iconBorderWidth  = 0.5;
    }
    return self;
}

- (void)setIconSize:(CGSize)iconSize {
    _iconSize = iconSize;
    
    self.iconCornerRadius = iconSize.width * 0.5;
}

@end
