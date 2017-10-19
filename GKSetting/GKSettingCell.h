//
//  GKSettingCell.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/15.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKSettingIconItem.h"
#import "GKSettingArrowItem.h"
#import "GKSettingSwitchItem.h"
#import "GKSettingExitItem.h"
#import "UIView+GKFrame.h"

@interface GKSettingCell : UITableViewCell

@property (nonatomic, strong) GKSettingItem *settingItem;

@property (nonatomic, assign) NSInteger sectionCount;

@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView;

@end
