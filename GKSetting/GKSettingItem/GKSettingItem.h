//
//  GKSettingItem.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/15.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
//_UITableViewCellSeparatorView
typedef NS_ENUM(NSUInteger, GKSettingCellSeparatorAlignType) {
    GKSettingCellSeparatorAlignTypeText,   // 对齐textLabel
    GKSettingCellSeparatorAlignTypeImage,  // 对齐ImageView（没有时对齐textLabel）
    GKSettingCellSeparatorAlignTypeCell    // 对齐Cell
};

// detailText显示的位置
typedef NS_ENUM(NSUInteger, GKSettingDetailStyle) {
    GKSettingDetailStyleNone,       // 无
    GKSettingDetailStyleBottom,     // 上下
    GKSettingDetailStyleCenter,     // 左中
    GKSettingDetailStyleRight       // 左右
};

@interface GKSettingItem : NSObject

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) UIColor *selectBackgroundColor;

/** icon的image对象，优先级最高 */
@property (nonatomic, strong) UIImage *iconImage;
/** icon图片的本地名称或网络地址 */
@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *detailText;

/** 设置字体大小 */
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIFont *detailTextFont;

/** 设置文字颜色 */
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *detailTextColor;

/** 箭头的图片 */
@property (nonatomic, strong) UIImage *arrowImage;

/** cell的高度，默认是44 */
@property (nonatomic, assign) CGFloat cellHeight;

/** textLabel距离左边（cell或imageView）的距离，默认15 */
@property (nonatomic, assign) CGFloat textSpace;

/** 分割线对齐方式，默认对齐textLabel */
@property (nonatomic, assign) GKSettingCellSeparatorAlignType separatorAlignType;

/** detailText类型，默认None */
@property (nonatomic, assign) GKSettingDetailStyle detailStyle;

@property (nonatomic, copy) void(^operation)(void);

+ (instancetype)itemWithIcon:(NSString *)icon text:(NSString *)text;

+ (instancetype)itemWithText:(NSString *)text;

@end
