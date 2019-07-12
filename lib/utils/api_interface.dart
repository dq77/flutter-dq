
import 'package:flutter_taozugong_app/utils/http_util.dart';
import 'package:flutter_taozugong_app/utils/common_error_handler_utils.dart';

/// 所有接口请求
class ApiInterface {

  /// 获取首页banner
  static final String _apiGetBannerlist = "/goods/banner/client/banner_list";
  static Future<Map<String, dynamic>> getBannerList(
      String channel, String categoryId, String count) async {
    return NetUtil.getJson(_apiGetBannerlist,
        {"channel": channel, "categoryId": categoryId, "count": count});
  }

  /// 获取首页导航
  static final String _API_GET_NAV_LIST = '/goods/nav/client/list';
  static Future<Map<String, dynamic>> getTeamFund(
      LoginInvalidHandler handler) async {
    return NetUtil.getJson(_API_GET_NAV_LIST, {})
        .catchError(handler.loginInvalidHandler);
  }

}
