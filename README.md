## GKSetting - iOS快速集成各种设置界面

## 说明
我们做APP的时候总会遇到各种的设置界面，在这里我对一些通用的cell进行了封装，能够快速创建并设置一些属性，做一些跳转等，让我们能够快速的集成设置界面，而不用去自定义cell，可以减少代码量。

GKSetting中包含了以下cell的形式：

所有item都继承自GKSettingItem：可设置cell的高度、背景色、选中背景色、分割线位置、detailTextLabel位置等

    1、GKSettingArrowItem：带右箭头的cell，箭头可隐藏
    2、GKSettingIconItem：继承自GKSettingArrowItem，可设置ImageView的大小、位置登
    3、GKSettingSwitchItem：带开关的cell
    4、GKSettingExitItem：textLabel现在在中间，通常用于退出登录
  
## 使用

    1、首先添加GKSettingView，里面包含了UITableView
    2、创建需要的GKSettingItem，设置属性
    3、创建GKSettingGroup可设置section的文字、高度，添加item
    4、刷新GKSettingView

## 效果图

![test1](https://github.com/QuintGao/GKSetting/blob/master/imgs/test1.png)

![test2](https://github.com/QuintGao/GKSetting/blob/master/imgs/test2.png)

![me](https://github.com/QuintGao/GKSetting/blob/master/imgs/me.png)

![setting](https://github.com/QuintGao/GKSetting/blob/master/imgs/setting.png)

![notify](https://github.com/QuintGao/GKSetting/blob/master/imgs/notify.png)











