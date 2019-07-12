import 'dart:convert';
import 'dart:async';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/utils/http.dart';

class OrderList {
  // 获取优惠券列表
  static Future getorderList(int page, int pageSize, String status,
      {String channel}) {
    String url = '/user_orders/${channel}/list';
    return HttpUtil().get(url);
  }
}
