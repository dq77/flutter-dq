import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/service/user/index.dart';

class OrderList extends Model {
  List _orderlist = [];
  get orderList => _orderlist;

  // 获取订单列表
  void fetchOrderList(args) async {}
}
