import 'package:flutter/material.dart';

import 'gzx_dropdown_menu_controller.dart';

/// Information about the dropdown menu widget, such as the height of the drop down menu to be displayed.
class GZXDropdownMenuBuilder {
  /// A dropdown menu displays the widget.
  final Widget dropDownWidget;

  /// Dropdown menu height.
  final double dropDownHeight;

  GZXDropdownMenuBuilder({
    required this.dropDownWidget,
    required this.dropDownHeight,
  });
}

typedef DropdownMenuChange = void Function(bool isShow, int? index);

/// Dropdown menu widget.
class GZXDropDownMenu extends StatefulWidget {
  final GZXDropdownMenuController controller;
  final List<GZXDropdownMenuBuilder> menus;
  final int animationMilliseconds;
  final Color maskColor;

  /// Called when dropdown menu start showing or hiding.
  final DropdownMenuChange? dropdownMenuChanging;

  /// Called when dropdown menu has been shown or hidden.
  final DropdownMenuChange? dropdownMenuChanged;

  /// Creates a dropdown menu widget.
  /// The widget must be inside the Stack because the widget is a Positioned.
  const GZXDropDownMenu({
    Key? key,
    required this.controller,
    required this.menus,
    this.animationMilliseconds = 500,
    this.maskColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.dropdownMenuChanging,
    this.dropdownMenuChanged,
  }) : super(key: key);

  @override
  _GZXDropDownMenuState createState() => _GZXDropDownMenuState();
}

class _GZXDropDownMenuState extends State<GZXDropDownMenu>
    with SingleTickerProviderStateMixin {
  bool _isShowDropDownItemWidget = false;
  bool _isShowMask = false;
  bool _isControllerDisposed = false;
  Animation<double>? _animation;
  AnimationController? _controller;

  late double _maskColorOpacity;

  double? _dropDownHeight;

  int? _currentMenuIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.controller.addListener(_onController);
    _controller = new AnimationController(
        duration: Duration(milliseconds: widget.animationMilliseconds),
        vsync: this);
  }

  _onController() {
//    print('_GZXDropDownMenuState._onController ${widget.controller.menuIndex}');

    _showDropDownItemWidget();
  }

  @override
  Widget build(BuildContext context) {
//    print('_GZXDropDownMenuState.build');
    _controller!.duration =
        Duration(milliseconds: widget.animationMilliseconds);
    return _buildDropDownWidget();
  }

  dispose() {
    _animation?.removeListener(_animationListener);
    _animation?.removeStatusListener(_animationStatusListener);
    widget.controller.removeListener(_onController);
    _controller?.dispose();
    _isControllerDisposed = true;
    super.dispose();
  }

  _showDropDownItemWidget() {
    _currentMenuIndex = widget.controller.menuIndex;
    if (_currentMenuIndex! >= widget.menus.length) {
      return;
    }

    _isShowDropDownItemWidget = !_isShowDropDownItemWidget;
    if (widget.dropdownMenuChanging != null) {
      widget.dropdownMenuChanging!(
          _isShowDropDownItemWidget, _currentMenuIndex);
    }
    if (!_isShowMask) {
      _isShowMask = true;
    }

    _dropDownHeight = widget.menus[_currentMenuIndex!].dropDownHeight;

    _animation?.removeListener(_animationListener);
    _animation?.removeStatusListener(_animationStatusListener);
    _animation =
        new Tween(begin: 0.0, end: _dropDownHeight).animate(_controller!)
          ..addListener(_animationListener)
          ..addStatusListener(_animationStatusListener);

    if (_isControllerDisposed) return;

//    print('${widget.controller.isShow}');

    if (widget.controller.isShow) {
      _controller!.forward();
    } else if (widget.controller.isShowHideAnimation) {
      _controller!.reverse();
    } else {
      _controller!.value = 0;
    }
  }

  void _animationStatusListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
//        print('dismissed');
        _isShowMask = false;
        if (widget.dropdownMenuChanged != null) {
          widget.dropdownMenuChanged!(false, _currentMenuIndex);
        }
        break;
      case AnimationStatus.forward:
        // TODO: Handle this case.
        break;
      case AnimationStatus.reverse:
        // TODO: Handle this case.
        break;
      case AnimationStatus.completed:
//        print('completed');
        if (widget.dropdownMenuChanged != null) {
          widget.dropdownMenuChanged!(true, _currentMenuIndex);
        }
        break;
    }
  }

  void _animationListener() {
    var heightScale = _animation!.value / _dropDownHeight!;
    _maskColorOpacity = widget.maskColor.opacity * heightScale;
//    print('$_maskColorOpacity');
    //这行如果不写，没有动画效果
    setState(() {});
  }

  Widget _mask() {
    if (_isShowMask) {
      return GestureDetector(
        onTap: () {
          widget.controller.hide();
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: widget.maskColor.withOpacity(_maskColorOpacity),
//          color: widget.maskColor,
        ),
      );
    } else {
      return Container(
        height: 0,
      );
    }
  }

  Widget _buildDropDownWidget() {
    int menuIndex = widget.controller.menuIndex;

    if (menuIndex >= widget.menus.length) {
      return Container();
    }

    return Positioned(
        top: widget.controller.dropDownMenuTop,
        left: 0,
        right: 0,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.infinity,
              height: _animation == null ? 0 : _animation!.value,
              child: widget.menus[menuIndex].dropDownWidget,
            ),
            _mask(),
          ],
        ));
  }
}
