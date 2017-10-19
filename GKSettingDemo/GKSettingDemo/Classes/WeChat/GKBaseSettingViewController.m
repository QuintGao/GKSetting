//
//  GKBaseSettingViewController.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/19.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKBaseSettingViewController.h"

@interface GKBaseSettingViewController ()

@end

@implementation GKBaseSettingViewController

- (GKSettingView *)settingView {
    if (!_settingView) {
        _settingView = [GKSettingView new];
        _settingView.frame = CGRectMake(0, self.gk_navigationBar.bottom, self.view.width, self.view.height - self.gk_navigationBar.height);
    }
    return _settingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.settingView];
}

@end
