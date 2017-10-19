//
//  GKSettingView.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKSettingGroup.h"
#import "GKSettingItem.h"
#import "GKSettingCell.h"

@interface GKSettingView : UIView

@property (nonatomic, strong) NSMutableArray *allGroups;

- (void)reloadData;

- (void)reloadDataWithSection:(NSInteger)section;
- (void)reloadDataWithIndexPath:(NSIndexPath *)indexPath;

@end
