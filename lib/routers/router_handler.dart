import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_taozugong_app/pages/index.dart';
import 'package:flutter_taozugong_app/pages/home/index.dart';
import 'package:flutter_taozugong_app/pages/login/index.dart';
import 'package:flutter_taozugong_app/pages/login/register/index.dart';
import 'package:flutter_taozugong_app/pages/login/resetPassword/index.dart';
import 'package:flutter_taozugong_app/pages/login/smsLogin/index.dart';
import 'package:flutter_taozugong_app/pages/login/updatepassword/index.dart';

import 'package:flutter_taozugong_app/pages/goods/index.dart';
import 'package:flutter_taozugong_app/pages/mine/MyCoupon/index.dart';
import 'package:flutter_taozugong_app/pages/mine/address/addressAdd.dart';
import 'package:flutter_taozugong_app/pages/mine/address/index.dart';
import 'package:flutter_taozugong_app/pages/mine/commonProblem/index.dart';
import 'package:flutter_taozugong_app/pages/mine/feedback/index.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/index.dart';
import 'package:flutter_taozugong_app/pages/order/orderList/index.dart';
import 'package:flutter_taozugong_app/pages/order/orderDetail/index.dart';
import 'package:flutter_taozugong_app/pages/order/payResult/index.dart';

import 'package:flutter_taozugong_app/pages/custom.dart';

Handler indexHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('homeHandle ${params}');
  //return HomePage(params);
  return HomePage();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('LoginHandle ${params}');
  return LoginPage();
});

Handler registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('registerHandler ${params}');
  return Register();
});

Handler resetPasswordHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('resetPasswordHandler ${params}');
  return ResetPassword();
});

Handler smsLoginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('smsLoginHandler ${params}');
  return SMSLogin();
});

Handler updatePasswordHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('updatePasswordHandler ${params}');
  return UpdatePasswordPage();
});

Handler customHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('CustomScrollViewTestRoute ${params}');
  return CustomScrollViewTestRoute();
});

// 地址管理列表
Handler addressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('AddressManagement ${params}');
  String fromPage = params['fromPage']?.first;
  print('AddressManagement ${fromPage}');
  return AddressManagement(fromPage:fromPage);
});

// 地址添加
Handler addressInFoEditHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('AddressAdd ${params}');
  String type = params['type'].first;
  String id = params['id']?.first;
  print('AddressAdd ${type}');
  print('AddressAdd ${id}');
  return AddressInFoEdit(type: type, id: id);
});
// 我的优惠券
Handler myCouponPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MyCouponPage();
});
// 常见问题
Handler commonProblemHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CommonProblem();
});
// 意见反馈
Handler feedBackHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FeedBackPage();
});

Handler goodsDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsNo = params['no'].first;
  print('index>details goodsNo is ${goodsNo}');

  return GoodsDetailPage(goodsNo: goodsNo);
});

Handler orderConfirmHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OrderConfirmPage();
});

Handler payResultHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PayResult();
});

Handler orderListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OrderListPage();
});

Handler orderDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OrderDetailPage();
});
