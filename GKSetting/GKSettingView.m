//
//  GKSettingView.m
//  GKSetting
//
//  Created by QuintGao on 2017/10/17.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKSettingView.h"

@interface GKSettingView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GKSettingView

- (NSMutableArray *)allGroups {
    if (!_allGroups) {
        _allGroups = [NSMutableArray new];
    }
    return _allGroups;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        self.tableView.dataSource = self;
        self.tableView.delegate   = self;
        self.tableView.showsVerticalScrollIndicator = NO;
        
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView.frame = self.bounds;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.tableView.backgroundColor = backgroundColor;
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (void)reloadDataWithSection:(NSInteger)section {
    GKSettingGroup *group = self.allGroups[section];
    
    NSMutableArray *indexPaths = [NSMutableArray new];
    
    [group.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:section];
        [indexPaths addObject:indexPath];
    }];
    
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}

- (void)reloadDataWithIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GKSettingGroup *group = self.allGroups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GKSettingCell *cell = [GKSettingCell settingCellWithTableView:tableView];
    
    GKSettingGroup *group = self.allGroups[indexPath.section];
    
    cell.sectionCount = group.items.count;
    cell.indexPath    = indexPath;
    
    cell.settingItem  = group.items[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GKSettingGroup *group = self.allGroups[indexPath.section];
    
    GKSettingItem *item = group.items[indexPath.row];
    
    return item.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GKSettingGroup *group = self.allGroups[section];

    return group.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    GKSettingGroup *group = self.allGroups[section];

    return group.footerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    GKSettingGroup *group = self.allGroups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    GKSettingGroup *group = self.allGroups[section];
    return group.footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GKSettingGroup *group = self.allGroups[indexPath.section];
    GKSettingItem *item = group.items[indexPath.row];
    
    !item.operation ? : item.operation();
}

@end
