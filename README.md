# gzx_dropdown_menu

[![Pub Package](https://img.shields.io/pub/v/gzx_dropdown_menu.svg)](https://pub.dev/packages/gzx_dropdown_menu)
[![GitHub Stars](https://img.shields.io/github/stars/ganzhixiong/gzx_dropdown_menu.svg)](https://github.com/ganzhixiong/gzx_dropdown_menu/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/ganzhixiong/gzx_dropdown_menu.svg)](https://github.com/ganzhixiong/gzx_dropdown_menu/network)
[![GitHub Issues](https://img.shields.io/github/issues/ganzhixiong/gzx_dropdown_menu.svg)](https://github.com/ganzhixiong/gzx_dropdown_menu/issues)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/ganzhixiong/gzx_dropdown_menu/master/LICENSE)

这是一个Flutter自定义功能强大的轻量级**下拉筛选菜单**Package，它支持iOS和Android。

***
- 🙀开源不易，麻烦给个Star⭐️吧！我会根据大家的关注度和个人时间持续更新代码！
- 🙀如你想接收更新消息，你可以Watch下，有问题请提到Issues。
***

# 导航
- [功能介绍](#功能介绍)
- [待办事项](#待办事项)
- [Gif效果图](#Gif效果图)
- [如何使用](#如何使用)
- [相关Repository](#相关Repository)
- [相关文章](#相关文章)
- [捐助开发者](#捐助开发者)

# 功能介绍
A custom is strong dropdown menu for Flutter. Easy to use and powerful for customization, it's up to you what you want to display in the dropdown menu!

 * Custom dropdown header
 * Custom dropdown header item
 * Custom dropdown menu
 * Custom dropdown menu animation
 * Control dropdown menu show or hide

**<u>[查看版本更新记录](https://pub.flutter-io.cn/packages/gzx_dropdown_menu#-changelog-tab-)</u>**

# 待办事项
- [ ] 由于GZXDropDownMenu只能在Stack内使用，扩展性还不够强
- [ ] 支持CustomScrollView和NestedScrollView
- [ ] ..........

# Gif效果图
效果图展示了仿美团和淘宝的下拉筛选菜单。
- 美团的代码就在这个仓库的example目录下
- 淘宝的代码在[Flutter 淘宝](https://github.com/GanZhiXiong/GZXTaoBaoAppFlutter)

<!---
这样写pub上Readme图片不能显示
<img src="https://github.com/GanZhiXiong/gzx_dropdown_menu/blob/master/preview_images/美团.gif" width="439" height="860" align=center /><img src="https://github.com/GanZhiXiong/gzx_dropdown_menu/blob/master/preview_images/淘宝.gif" width="439" height="860" align=center />
--->

<a target="_blank" rel="noopener noreferrer" href="https://github.com/GanZhiXiong/gzx_dropdown_menu/blob/master/preview_images/美团.gif"><img src="https://github.com/GanZhiXiong/gzx_dropdown_menu/raw/master/preview_images/美团.gif" width="439" height="860" align="center" style="max-width:100%;"></a><a target="_blank" rel="noopener noreferrer" href="https://github.com/GanZhiXiong/gzx_dropdown_menu/blob/master/preview_images/淘宝.gif"><img src="https://github.com/GanZhiXiong/gzx_dropdown_menu/raw/master/preview_images/淘宝.gif" width="439" height="860" align="center" style="max-width:100%;"></a>

[//]: # (
<img src="https://github.com/GanZhiXiong/gzx_dropdown_menu/blob/master/preview_images/美团.gif" width="414" hegiht="736" align=center /><img src="https://github.com/GanZhiXiong/gzx_dropdown_menu/blob/master/preview_images/淘宝.gif" width="414" hegiht="736" align=center />)

# 如何使用
目前已发布到Pub，你可以在Pub官网查看最新的版本和更新说明！[去Pub官网查看](https://pub.flutter-io.cn/packages/gzx_dropdown_menu)
## 1、添加gzx_dropdown_menu package
打开pubspec.yaml文件
添加如下代码
``` dart
  gzx_dropdown_menu: ^3.0.0+3
```
添加后打开Terminal，执行flutter packages get

## 2、使用
- **强烈建议你先clone下本仓库**
- 然后运行下看下效果
- 打开本仓库example项目下的gzx_dropdown_menu_test_page.dart文件自己看。

没空编辑文字了，而且说这么多还不如你直接运行下看下效果，然后看下代码，就知道如何使用了。

**~~算了~~🤪🤪🤪🙄还是简单说下吧！！！**  
你只需要将GZXDropDownHeader和GZXDropDownMenu嵌套到你的代码中即可
### GZXDropDownHeader
**这里要注意了，这些参数不是必须要要写的，我写出来只是让你知道强大的自定义功能，实际上就前面三个参数是必填的**
``` dart
  // 下拉菜单头部
  GZXDropDownHeader(
    // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
    items: [
      GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
      GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1], iconData: Icons.keyboard_arrow_down, iconDropDownData: Icons.keyboard_arrow_up),
      GZXDropDownHeaderItem(_dropDownHeaderItemStrings[2], style: TextStyle(color: Colors.green)),
      GZXDropDownHeaderItem(_dropDownHeaderItemStrings[3], iconData: Icons.filter_frames, iconSize: 18),
    ],
    // GZXDropDownHeader对应第一父级Stack的key
    stackKey: _stackKey,
    // controller用于控制menu的显示或隐藏
    controller: _dropdownMenuController,
    // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
    onItemTap: (index) {
      if (index == 3) {
        _scaffoldKey.currentState.openEndDrawer();
        _dropdownMenuController.hide();
      }
    },
    // 头部的高度
    height: 40,
    // 头部背景颜色
    color: Colors.red,
    // 头部边框宽度
    borderWidth: 1,
    // 头部边框颜色
    borderColor: Color(0xFFeeede6),
    // 分割线高度
    dividerHeight: 20,
    // 分割线颜色
    dividerColor: Color(0xFFeeede6),
    // 文字样式
    style: TextStyle(color: Color(0xFF666666), fontSize: 13),
    // 下拉时文字样式
    dropDownStyle: TextStyle(
      fontSize: 13,
      color: Theme.of(context).primaryColor,
    ),
    // 图标大小
    iconSize: 20,
    // 图标颜色
    iconColor: Color(0xFFafada7),
    // 下拉时图标颜色
    iconDropDownColor: Theme.of(context).primaryColor,
  ),
```
### GZXDropDownMenu
``` dart
  // 下拉菜单
  GZXDropDownMenu(
    // controller用于控制menu的显示或隐藏
    controller: _dropdownMenuController,
    // 下拉菜单显示或隐藏动画时长
    animationMilliseconds: 500,
    // 下拉后遮罩颜色
    maskColor: Colors.red.withOpacity(0.5),
    dropdownMenuChanging: (isShow, index) {
      setState(() {
        _dropdownMenuChange = '(正在${isShow ? '显示' : '隐藏'}$index)';
        print(_dropdownMenuChange);
      });
    },
    dropdownMenuChanged: (isShow, index) {
      setState(() {
        _dropdownMenuChange = '(已经${isShow ? '显示' : '隐藏'}$index)';
        print(_dropdownMenuChange);
      });
    },    
    // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
    menus: [
      GZXDropdownMenuBuilder(
          dropDownHeight: 40 * 8.0,
          dropDownWidget: _buildQuanChengWidget((selectValue) {
            _dropDownHeaderItemStrings[0] = selectValue;
            _dropdownMenuController.hide();
            setState(() {});
          })),
      GZXDropdownMenuBuilder(
          dropDownHeight: 40 * 8.0,
          dropDownWidget: _buildConditionListWidget(_brandSortConditions, (value) {
            _selectBrandSortCondition = value;
            _dropDownHeaderItemStrings[1] =
            _selectBrandSortCondition.name == '全部' ? '品牌' : _selectBrandSortCondition.name;
            _dropdownMenuController.hide();
            setState(() {});
          })),
      GZXDropdownMenuBuilder(
          dropDownHeight: 40.0 * _distanceSortConditions.length,
          dropDownWidget: _buildConditionListWidget(_distanceSortConditions, (value) {
            _dropDownHeaderItemStrings[2] = _selectDistanceSortCondition.name;
            _selectDistanceSortCondition = value;
            _dropdownMenuController.hide();
            setState(() {});
          })),
    ],
  )
```

# 相关Repository
* [Flutter 淘宝App](https://github.com/GanZhiXiong/GZXTaoBaoAppFlutter)

# 相关文章
* [作者CSDN](https://blog.csdn.net/oHaiKuoTianKong1682)

# 捐助开发者
![](https://github.com/GanZhiXiong/GZXTaoBaoAppFlutter/blob/master/preview_images/thanks.png)
