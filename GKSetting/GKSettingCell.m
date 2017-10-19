//
//  GKSettingCell.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/15.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingCell.h"

@interface GKSettingCell()
{
    UIImageView *_arrowImageView;
    UISwitch *_switch;
}
@end

@implementation GKSettingCell

+ (instancetype)settingCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"GKSettingCellID";
    
    GKSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}

- (void)setSettingItem:(GKSettingItem *)settingItem {
    _settingItem = settingItem;
    
    if (settingItem.backgroundColor) {
        UIView *backgroundView = [UIView new];
        backgroundView.backgroundColor = settingItem.backgroundColor;
        self.backgroundView = backgroundView;
    }
    
    if (settingItem.selectBackgroundColor) {
        UIView *selectedBackgroundView = [UIView new];
        selectedBackgroundView.backgroundColor = settingItem.selectBackgroundColor;
        self.selectedBackgroundView = selectedBackgroundView;
    }
    
    if (settingItem.iconImage) {
        self.imageView.image = settingItem.iconImage;
    }else if (settingItem.icon && ![settingItem.icon isEqualToString:@""]) {
        // 判断是否是网络图片
        if ([settingItem.icon hasPrefix:@"http"]) {
            // 使用时需要加入SDWebImage
//            [self.imageView sd_setImageWithURL:[NSURL URLWithString:settingItem.icon]];
        }else {
            self.imageView.image = [UIImage imageNamed:settingItem.icon];
        }
    }else {
        self.imageView.image = nil;
        
    }
    
    self.textLabel.text       = settingItem.text;
    
    self.detailTextLabel.text = settingItem.detailText;
    
    if (settingItem.textFont) {
        self.textLabel.font = settingItem.textFont;
    }else {
        self.textLabel.font = [UIFont systemFontOfSize:17.0];
    }
    
    if (settingItem.detailTextFont) {
        self.detailTextLabel.font = settingItem.textFont;
    }else {
        self.detailTextLabel.font = [UIFont systemFontOfSize:17.0];
    }
    
    if (settingItem.textColor) {
        self.textLabel.textColor = settingItem.textColor;
    }else {
        self.textLabel.textColor = [UIColor blackColor];
    }
    
    if (settingItem.detailTextColor) {
        self.detailTextLabel.textColor = settingItem.detailTextColor;
    }else {
        self.detailTextLabel.textColor = [UIColor colorWithRed:0.556863 green:0.556863 blue:0.576471 alpha:1.0];
    }
    
    if ([settingItem isKindOfClass:[GKSettingIconItem class]]) {
        [self setupIconItem];
    }else if ([settingItem isKindOfClass:[GKSettingArrowItem class]]) {
        [self setupArrowItem];
    }else if ([settingItem isKindOfClass:[GKSettingSwitchItem class]]) {
        [self setupSwitchItem];
    }else {
        self.accessoryView  = nil;
        self.accessoryType  = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.imageView.image) {
        self.imageView.frame = CGRectZero;
    }
    
    if (!self.textLabel.text || [self.textLabel.text isEqualToString:@""]) {
        self.textLabel.frame = CGRectZero;
    }
    
    self.textLabel.left = self.imageView.right + self.settingItem.textSpace;
    
    if ([self.settingItem isKindOfClass:[GKSettingIconItem class]]) {
        [self setupIconFrames:(GKSettingIconItem *)self.settingItem];
    }else if ([self.settingItem isKindOfClass:[GKSettingArrowItem class]]) {
        [self setupArrowFrames:(GKSettingArrowItem *)self.settingItem];
    }else if ([self.settingItem isKindOfClass:[GKSettingSwitchItem class]]) {
        [self setupDetailFrames];
    }else if ([self.settingItem isKindOfClass:[GKSettingExitItem class]]) {
        // 设置textLabel居中
        self.textLabel.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    }else {
        [self setupDetailFrames];
    }
    
    // 设置分割线的frame
    [self setupSeparactorFrames];
}

#pragma mark - update frames
- (void)setupDetailFrames {
    self.detailTextLabel.hidden = NO;
    [self.detailTextLabel sizeToFit];
    
    if (self.settingItem.detailStyle == GKSettingDetailStyleNone) {
        self.detailTextLabel.hidden = YES;
    }else if (self.settingItem.detailStyle == GKSettingDetailStyleRight) {
        if ([self.settingItem isKindOfClass:[GKSettingArrowItem class]]) {
            GKSettingArrowItem *item = (GKSettingArrowItem *)self.settingItem;
            self.detailTextLabel.right = item.hideArrow ? self.width - 15 : self.contentView.right;
        }else {
            if (self.accessoryView == nil || self.accessoryType == UITableViewCellAccessoryNone) {
                self.detailTextLabel.right = self.contentView.right - 15;
            }else {
                self.detailTextLabel.right = self.contentView.right;
            }
        }
    }else if (self.settingItem.detailStyle == GKSettingDetailStyleBottom) {
        self.textLabel.top          = 2;
        self.detailTextLabel.bottom = self.height - 2;
        self.detailTextLabel.left   = self.textLabel.left;
    }else if (self.settingItem.detailStyle == GKSettingDetailStyleCenter) {
        self.detailTextLabel.left   = self.textLabel.right + 10;
    }
}

- (void)setupArrowFrames:(GKSettingArrowItem *)item {
    [self setupDetailFrames];
}

- (void)setupIconFrames:(GKSettingIconItem *)item {
    self.imageView.size    = item.iconSize;
    self.imageView.centerY = self.height * 0.5;
    
    [self setupDetailFrames];
    
    if (item.iconStyle == GKSettingIconStyleLeft) {
        if (item.detailStyle == GKSettingDetailStyleBottom) {
            self.textLabel.top = self.imageView.top + 5;
            self.detailTextLabel.bottom = self.imageView.bottom - 5;
        }
        self.textLabel.left = self.imageView.right + item.textSpace;
        self.detailTextLabel.left = self.textLabel.left;
    }else if (item.iconStyle == GKSettingIconStyleCenter) {
        
        self.textLabel.left = item.textSpace;
        if (item.detailStyle == GKSettingDetailStyleCenter) {
            self.detailTextLabel.left = self.textLabel.left;
        }
        if (!self.textLabel.text || [self.textLabel.text isEqualToString:@""]) {
            self.imageView.left = 15;
        }else {
            self.imageView.left = self.textLabel.right + 10;
        }
    }else {
        self.textLabel.left = item.textSpace;
        
        self.imageView.right = item.hideArrow ? self.width - 15 : self.contentView.right;
        
        if (item.detailStyle == GKSettingDetailStyleCenter) {
            self.detailTextLabel.left = self.textLabel.left;
        }else if (item.detailStyle == GKSettingDetailStyleRight) {
            self.detailTextLabel.hidden = YES;
        }
    }
}

- (void)setupSeparactorFrames {
    // 最后一个不作处理
    if (self.indexPath.row == self.sectionCount - 1) {
        
    }else { //_UITableViewCellSeparatorView
        __block UIView *separatorView = nil;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UITableViewCellSeparatorView")]) {
                if (obj.top != 0) {
                    separatorView = obj;
                }
            }
        }];
        if (separatorView) {
            switch (self.settingItem.separatorAlignType) {
                case GKSettingCellSeparatorAlignTypeText:
                {
                    separatorView.left  = self.textLabel.left;
                    separatorView.width = self.width - self.textLabel.left;
                }
                    break;
                case GKSettingCellSeparatorAlignTypeImage:
                {
                    if (self.imageView.image) {
                        separatorView.left = self.imageView.left;
                    }else {
                        separatorView.left = self.textLabel.left;
                    }
                    
                    separatorView.width = self.width - separatorView.left;
                }
                    break;
                case GKSettingCellSeparatorAlignTypeCell:
                {
                    separatorView.left  = 0;
                    separatorView.width = self.width;
                }
                    break;
                    
                default:
                    break;
            }
        }
    }
}

#pragma mark - Private Methods
- (void)setupIconItem {
    [self setupArrowItem];
    
    GKSettingIconItem *item = (GKSettingIconItem *)_settingItem;
    
    self.imageView.layer.cornerRadius  = item.iconCornerRadius;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor   = item.iconBorderColor.CGColor;
    self.imageView.layer.borderWidth   = item.iconBorderWidth;
}

- (void)setupArrowItem {
    
    GKSettingArrowItem *item = (GKSettingArrowItem *)_settingItem;
    
    if (item.hideArrow) {
        self.accessoryView = nil;
        _arrowImageView    = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
    }else {
        if (item.arrowImage) {
            _arrowImageView = [[UIImageView alloc] initWithImage:item.arrowImage];
            self.accessoryView = _arrowImageView;
        }else {
            _arrowImageView    = nil;
            self.accessoryView = nil;
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

- (void)setupSwitchItem {
    
    if (!_switch) {
        _switch = [[UISwitch alloc] init];
        [_switch addTarget:self action:@selector(switchValueChanged) forControlEvents:UIControlEventValueChanged];
    }
    
    GKSettingSwitchItem *switchItem = (GKSettingSwitchItem *)_settingItem;
    _switch.on = switchItem.open;
    
    self.accessoryView  = _switch;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)switchValueChanged {
    GKSettingSwitchItem *item = (GKSettingSwitchItem *)_settingItem;
    item.open = _switch.on;
    
    !item.switchChangeBlock ? : item.switchChangeBlock(item.open);
}

@end
