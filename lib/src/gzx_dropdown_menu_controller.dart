import 'package:flutter/foundation.dart';

enum DropDownType { current, another }

class GZXDropdownMenuController extends ChangeNotifier {
  double dropDownHeaderHeight;

  int menuIndex = 0;

  bool isShow = false;

  bool isShowHideAnimation = false;

  DropDownType dropDownType;

  void show(int index) {
    isShow = true;
    menuIndex = index;
    notifyListeners();
  }

  void hide({bool isShowHideAnimation = true}) {
    this.isShowHideAnimation = isShowHideAnimation;
    isShow = false;
    notifyListeners();
  }
}
