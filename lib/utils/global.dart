import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

class Constants {
  static double width = 0;
  static double height = 0;
}

void toastmsgTop(String msg) {
  Fluttertoast.showToast(
    gravity: ToastGravity.CENTER,
    fontSize: 12,
    msg: msg,
    backgroundColor: AppColors.primary,
    textColor: AppColors.backgroundColor,
  );
}
