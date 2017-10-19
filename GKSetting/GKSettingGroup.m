//
//  GKSettingGroup.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingGroup.h"

@implementation GKSettingGroup

- (instancetype)init {
    if (self = [super init]) {
        self.headerHeight = UITableViewAutomaticDimension;
        self.footerHeight = UITableViewAutomaticDimension;
    }
    return self;
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    _headerHeight = headerHeight;
    
    if (headerHeight == 0) {
        _headerHeight = 0.1;
    }
}

- (void)setFooterHeight:(CGFloat)footerHeight {
    _footerHeight = footerHeight;
    
    if (footerHeight == 0) {
        _footerHeight = 0.1;
    }
}

@end
