import 'package:flutter/widgets.dart';

class SizeConfig {

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double safeAreaVertical;

  void init(BuildContext context){

    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    safeAreaVertical = (screenHeight - _mediaQueryData.padding.top + _mediaQueryData.padding.bottom);

    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;

  }

}