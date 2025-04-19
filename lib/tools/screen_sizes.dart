
import 'package:flutter/cupertino.dart';

class ScreenSizes {
  static final ScreenSizes _instance = ScreenSizes._internal();
  factory ScreenSizes() => _instance;
  ScreenSizes._internal();

  late Size _size;
  late double _width;
  late double _height;

  void init(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _width = _size.width;
    _height = _size.height;
  }

  double get width => _width;
  double get height => _height;
  Size get size => _size;
}