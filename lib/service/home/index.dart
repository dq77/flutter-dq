import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_taozugong_app/utils/http.dart';
import 'package:flutter_taozugong_app/common/service_urls.dart';
import 'package:flutter_taozugong_app/common/config.dart';

/// 首页所有接口请求
class HomeApiInterface {
  /// 测试
  static Future getData() async {
    Dio dio = new Dio();
    //    Response response = await dio.get(
    //        "http://47.98.113.37:8080/goods/banner/client/banner_list",
    //        queryParameters: {"channel": "APP"});
    Response response = await dio.request('http://47.98.113.37:8080/goods/banner/client/banner_list',queryParameters: {"channel": "APP"}, options: Options(method: 'GET'));
    // print(
    //   '测试测试222 ${response.data.toString()}',
    // );
  }

  /// 获取首页banner
  static Future getBannerList(String count,{String channel}) {

    print('我进来请求接口了 $channel');
    return HttpUtil().get(serviceUrls['apiGetBannerlist'],data:{"channel": channel == null ? HttpConfig.channel:channel, "count": count});
         
  }

  /// 获取首页导航
  static Future getNavList({String channel}) async {
    return HttpUtil().get(serviceUrls['apiGetNavList'], data:{"channel": channel == null ? HttpConfig.channel:channel});
  }

  /// 获取精选速递
  static Future getSelectionsList({String channel}) async {
    return HttpUtil().get(serviceUrls['apiGetRecommendationList'], data:{"channel": channel == null ? HttpConfig.channel:channel});
  }

}
