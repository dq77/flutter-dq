import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/service/order/index.dart';
import 'package:flutter_taozugong_app/model/order/entity.dart';

import 'package:flutter_taozugong_app/utils/toast.dart';

import 'package:tobias/tobias.dart' as tobias;


class OrderModel extends Model {
  OrderConfirmData _orderConfirmData;
  CouponListData _selectedCoupon;

  get orderConfirmData => _orderConfirmData;
  get selectedCoupon => _selectedCoupon;

  // 获取订单确认数据 getConfirmData
  void getConfirmData(String payType, List productInfo) async {
    print('获取订单确认数据');
    var orderConfirmDataRes =
        await OrderApiInterface.getConfirmData(payType, productInfo);
    print('获取订单确认数据1 ${orderConfirmDataRes.toString()}');
    var orderConfirmEntity =
        new GetConfirmDataResp.fromJson(orderConfirmDataRes);
    print('获取订单确认数据2 ${orderConfirmEntity.data.toString()}');

    if (orderConfirmEntity.code == 200) {
      _orderConfirmData = orderConfirmEntity.data;
      _selectedCoupon = _orderConfirmData?.couponList[0];
    } else {
      Toast.show('${orderConfirmEntity.subMsg}');
    }

    notifyListeners();
  }

  // 获取分期详情
  void getBillAmouut(double totalAmount, int divideCount, double discountAmount,
      double firstAmount) async {
    var getBillAmountRes = await OrderApiInterface.getBillAmount(
        totalAmount, divideCount, discountAmount, firstAmount);
  }

  // 创建订单
  void createOrder(
    int addressId,
    List<Map<String, dynamic>> productInfo,
    String deposit,
    String firstPayAmount, // 应付押金
    String payChannel,
    String payType,
    String callbackUrl, {
    int couponId,
    String tradeType,
    int payBackId,
    String idCard,
    String originNo,
    String buyerMessage,
    String channel,
    int bargainId,
    String alipayCode,
    List payTypeList,
    String uid,
  }) async {
    var createOrderRes = await OrderApiInterface.createOrder(
        addressId,
        couponId,
        productInfo,
        deposit,
        firstPayAmount,
        payChannel,
        payType,
        callbackUrl,
        tradeType,
        idCard:idCard
        );

    print('创建订单返回结果 ${createOrderRes.toString()}');
    var createOrderEntity = new CreateOrderResp.fromJson(createOrderRes);
    print('创建订单返回结果2 ${createOrderEntity.data.toString()}');
    if(createOrderEntity.code == 12){
      
      tobias.pay(createOrderEntity.data.orderStr);

    } else {
      Toast.show('${createOrderEntity.subMsg}');
    }
    
  }

  // HomeModel of(context) => ScopedModel.of<HomeModel>(context,rebuildOnChange:true);
}
