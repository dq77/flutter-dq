import 'dart:convert';
import 'dart:async';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/utils/http.dart';

// import 'package:dio/dio.dart';
// import 'package:flutter_taozugong_app/utils/http_util.dart';
// import 'package:flutter_taozugong_app/utils/common_error_handler_utils.dart';
// import 'package:flutter_taozugong_app/common/service_urls.dart';

/// 商品相关所有接口请求
class GoodsApiInterface {
  /// 获取商品类目
  static Future getGoodsCategoryList({String channel}) {
    String getGoodsCategoryPath =
        '/goods/channel_category/client/list/${channel == null ? HttpConfig.channel : channel}';
    return HttpUtil().get(getGoodsCategoryPath);
  }

  // 根据类目ID 获取商品列表
  static Future getGoodsByCategoryId(
      {int channelCategoryId,
      String channel,
      int businessType,
      int page,
      int pageSize,
      String keyWords,
      String label,
      List noList}) {
    String getGoodsByCategoryIdPath = '/goods/client/goods_list';
    return HttpUtil().post(getGoodsByCategoryIdPath, data: {
      "channel": channel == null ? HttpConfig.channel : channel,
      "channelCategoryId": channelCategoryId,
      "page": page == null ? 1 : page,
      "pageSize": pageSize == null ? 10 : pageSize,
      "keyWords": keyWords,
      "label": label,
      "noList": noList,
    });
  }

  /// 获取商品详情
  static Future getGoodsDetail(String goodsNo) async {
    String getGoodsDetailPath = "/goods/client/goods_detail/${goodsNo}";
    return HttpUtil().get(getGoodsDetailPath);
  }

  /// 获取商品sku
  static Future getGoodsSkuDetailById(String goodsNo) async {
    String getGoodsSkuDetailPath = '/goods/sku/client/sku_list/${goodsNo}';
    return HttpUtil().get(getGoodsSkuDetailPath);
  }

  /// 获取商品可领优惠券
  static Future getGoodsCoupons(String goodsNo,{String channel}) async {
    String getGoodsCouponsPath =
        '/user_coupon/show_goods_coupons/${channel == null ? HttpConfig.channel : channel}/${goodsNo}';
    return HttpUtil().get(getGoodsCouponsPath);
  }

  /// 用户可领取的所有优惠券
  static Future getChannelCouponsList({String channel}) async {
    String getChannelCouponsListPath =
        '/user_coupon/show_channel_coupons/${channel == null ? HttpConfig.channel : channel}';
    return HttpUtil().get(getChannelCouponsListPath);
  }

  /// 领取单张优惠券
  static Future getCoupons(String couponId) async {
    String getCouponsPath = '/user_coupon/collect_coupons/${couponId}';
    return HttpUtil().get(getCouponsPath);
  }

  /// 获取商品库存
  static Future checkSkuStock(String skuId) async {
    String checkSkuStockPath = '/goods/sku/client/check_sku_stock/${skuId}';
    return HttpUtil().get(checkSkuStockPath);
  }
  
}
