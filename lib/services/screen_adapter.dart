import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaper {

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static size(num value) {
    return ScreenUtil().setSp(value);
  }

  static getScreenWidth() {
    return ScreenUtil().screenWidth;
  }

  static getScreenHeight() {
    return ScreenUtil().screenHeight;
  }

}