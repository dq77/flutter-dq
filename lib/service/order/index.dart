import 'dart:convert';
import 'dart:async';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/utils/http.dart';

/// 订单支付所有接口请求
class OrderApiInterface {
  /// 获取优惠券列表
  static Future getMyCouponsList(String status, {String channel}) {
    String getMyCouponsListPath =
        '/user_coupon/my_coupons/${channel == null ? HttpConfig.channel : channel}/${status}';
    return HttpUtil().get(getMyCouponsListPath);
  }

  // 获取确认订单数据
  static Future getConfirmData(String payType, List productInfo,
      {String channel}) {
    String createOrderPath = '/user_orders/confirm';

    return HttpUtil().post(createOrderPath, data: {
      "channel": channel == null ? HttpConfig.channel : channel,
      "payType": payType,
      "productInfo": productInfo
    });
  }

  // 获取账单详情(正常订单)
  // totalAmount 总金额  divideCount 分期数
  // discountAmount 优惠金额  firstAmount 首期金额
  static Future getBillAmount(double totalAmount, int divideCount,
      double discountAmount, double firstAmount) {
    String getBillAmountPath = '/client/order/bill/amount';
    return HttpUtil().get(getBillAmountPath, data: {
      "totalAmount": totalAmount,
      "divideCount": divideCount,
      "discountAmount": discountAmount,
      "firstAmount": firstAmount
    });
  }

  // 获取账单详情(续租订单)
  static Future getReletGoodsBill(String orderNo, double totalAmount,
      int divideCount, double discountAmount, double firstAmount) {
    String getReletBillAmountPath = '/client/xuzu/order/${orderNo}/bill/amount';

    return HttpUtil().get(getReletBillAmountPath, data: {
      "orderNo": orderNo,
      "totalAmount": totalAmount,
      "divideCount": divideCount,
      "discountAmount": discountAmount,
      "firstAmount": firstAmount
    });
  }

  /// 下单(续租，买断，租赁)
  /// payBackId: orderBackVo.id || null,
  // addressId: topAddresInfo.id || '', // 当前用户的地址ID
  // bargainId: '', // 砍价活动ID(选填)
  // buyerMessage: buyerMessage, // 备注(选填)
  // channel: getGlobalData('Channel'), // 渠道
  // couponId: couponId === -1 ? '' : couponId, // 优惠卷Id(选填)
  // deposit: payDeposit, // 押金
  // firstPayAmount: payDeposit, // 应付押金
  // idCard: (userInfo && userInfo.isPass == 2) || GoodsInfoData.Buyout || GoodsInfoData.relet ? undefined : idCard, // 身份证号(选填) 已实名认证不用填写
  // originNo: GoodsInfoData.originNo, // (续租和买断的原始单号)
  // payChannel: this.formartPayChannel(payChannel), // 支付渠道
  // payType: payType, // 支付方式( 1一次性支付 2分期付)
  // productInfo: [
  //   {
  //     ...GoodsInfoData.productInfo,
  //     unit: GoodsInfoData.productInfo.unit == '月' ? 'MONTH' : 'DAY'
  //   }
  // ],
  // tradeType: GoodsInfoData.relet ? 'Renewal' : GoodsInfoData.Buyout ? 'Buyout' : '', // 交易方式( Lease租用 Sales售卖  Renewal续租  Buyout买断 )
  // callbackUrl: payType * 1 === 1 ? onepayUrl : siginUrl, // 签约回调地址 一次性支付传支付结果页的回调地址  分期支付传订单确认页
  // alipayCode: GoodsInfoData.alipayCode, // 支付宝支付需要
  // payTypeList: GoodsInfoData.payTypeList
  static Future createOrder(
    int addressId,
    int couponId,
    List<Map<String, dynamic>> productInfo,
    String deposit,
    String firstPayAmount, // 应付押金
    String payChannel,
    String payType,
    String callbackUrl,
    String tradeType,
     {
    int payBackId,
    String idCard,
    String originNo,
    String buyerMessage,
    String channel,
    int bargainId,
    String alipayCode,
    List payTypeList,
    String uid,
  }) {
    String createOrderPath = '/user_orders/create';

    return HttpUtil().post(createOrderPath, data: {
      "addressId": addressId,
      "couponId": couponId,
      "productInfo": productInfo,
      "deposit":deposit,
      "firstPayAmount":firstPayAmount,
      "payChannel":payChannel,
      "payType":payType,
      "callbackUrl":callbackUrl,
      "tradeType":tradeType,
      "alipayCode":alipayCode,
      "payTypeList":payTypeList,
      "payBackId":payBackId,
      "idCard":idCard == null ? "":idCard,
      "channel": channel == null ? HttpConfig.channel : channel,
      "bargainId":bargainId,
      "buyerMessage":buyerMessage == null?"":buyerMessage,
      "originNo":originNo
    });
  }
}
