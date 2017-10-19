//
//  GKSettingIconItem.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/18.
//  Copyright © 2017年 QuintGao. All rights reserved.
//  用于设置头像的cell

#import "GKSettingArrowItem.h"

// icon视图显示的位置
typedef NS_ENUM(NSUInteger, GKSettingIconStyle) {
    GKSettingIconStyleLeft,    // 显示在左边
    GKSettingIconStyleCenter,  // 显示在中间
    GKSettingIconStyleRight    // 显示在右边
};

@interface GKSettingIconItem : GKSettingArrowItem

/** icon图片的尺寸,默认60 */
@property (nonatomic, assign) CGSize iconSize;

/** icon圆角度数,默认宽度的一半 */
@property (nonatomic, assign) CGFloat iconCornerRadius;

/** 默认黑色 */
@property (nonatomic, strong) UIColor *iconBorderColor;

/** 默认0.5 */
@property (nonatomic, assign) CGFloat iconBorderWidth;

/** 头像显示的位置 */
@property (nonatomic, assign) GKSettingIconStyle iconStyle;

@end
