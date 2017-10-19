//
//  GKBaseSettingViewController.h
//  GKSetting
//
//  Created by QuintGao on 2017/10/19.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <GKNavigationBarViewController/GKNavigationBarViewController.h>
#import "GKSettingView.h"

@interface GKBaseSettingViewController : GKNavigationBarViewController

@property (nonatomic, strong) GKSettingView *settingView;

@end
