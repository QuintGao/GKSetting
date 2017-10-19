//
//  GKSettingGroup.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKSettingGroup : NSObject

/** section头部标题 */
@property (nonatomic, strong) NSString *header;
/** section尾部标题 */
@property (nonatomic, strong) NSString *footer;

/** 高度 */
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

/** section里面的cell数组 */
@property (nonatomic, strong) NSArray *items;

@end
