import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

final Map<String, ToastPosition> toastPosition = {
  "top": ToastPosition.top,
  "center": ToastPosition.center,
  "bottom": ToastPosition.bottom,
};

class Toast {
  static show(String msg, { String position}) {
    print('弹层提示 $msg');
    showToast(msg,
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: position == null ? ToastPosition.center:toastPosition[position],
        dismissOtherToast: true);
  }
}
