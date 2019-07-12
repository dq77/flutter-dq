import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_taozugong_app/utils/http.dart';
import 'package:flutter_taozugong_app/common/service_urls.dart';
import 'package:flutter_taozugong_app/common/config.dart';

/// 首页所有接口请求
class UserApiInterface {
  /// 用户注册
  static Future userRegister(
      String mobile, String password, String verification,
      {String channel}) {
    const userRegisterPath = '/user/register';
    return HttpUtil().post(userRegisterPath, data: {
      "channel": channel == null ? HttpConfig.channel : channel,
      "mobile": mobile,
      "password": password,
      "verification": verification
    });
  }

  /// 用户登录
  static Future userLogin(String mobile,
      {String password, String verification, String channel}) async {
    const userLoginPath = '/user/login';
    return HttpUtil().post(userLoginPath, data: {
      "channel": channel == null ? HttpConfig.channel : channel,
      "mobile": mobile,
      "password": password,
      "verification": verification
    });
  }

  /// 获取验证码
  /// businessType
  /// Register:注册
  /// EditPwd：忘记密码
  /// Login：登录
  /// Bind：绑定手机号
  static Future userGetAuthCode(String mobile, String businessType) async {
    const userGetAuthCodePath = '/user/get_auth_code';
    return HttpUtil().post(userGetAuthCodePath,
        data: {"mobile": mobile, "businessType": businessType});
  }

  /// 修改密码
  static Future modifyPassword(
      String mobile, String newPassword, String verification) async {
    const modifyPasswordPath = '/user/modify_password';
    return HttpUtil().post(modifyPasswordPath, data: {
      "mobile": mobile,
      "newPassword": newPassword,
      "verification": verification
    });
  }

  /// 找回密码
  static Future findPassword(
      String mobile, String newPassword, String verification) async {
    const findPasswordPath = '/user/find_password';
    return HttpUtil().post(findPasswordPath, data: {
      "mobile": mobile,
      "newPassword": newPassword,
      "verification": verification
    });
  }

  /// 手机号绑定
  static Future userBind({String channel}) async {
    const findPasswordPath = '/user/find_password';
    return HttpUtil().post(findPasswordPath,
        data: {"channel": channel == null ? HttpConfig.channel : channel});
  }

  /// 手机号解绑
  static Future userUnbind({String channel}) async {
    const findPasswordPath = '/user/find_password';
    return HttpUtil().post(findPasswordPath,
        data: {"channel": channel == null ? HttpConfig.channel : channel});
  }

  /// 手机号换绑
  static Future userUpdateBind({String channel}) async {
    const findPasswordPath = '/user/find_password';
    return HttpUtil().post(findPasswordPath,
        data: {"channel": channel == null ? HttpConfig.channel : channel});
  }

  // 获取用户信息
  static Future getUserInfo() async {
    const getUserInfoPath = '/get_user_info';
    return HttpUtil().get(getUserInfoPath);
  }

  // 获取用户信息
  static Future uploadFile(file) async {
    const getUserInfoPath = 'https://api.taozugong.cn:443/upload_suggest_pic';
    return HttpUtil().uploadFile(getUserInfoPath, file);
  }

  // 获取地址列表
  static Future getUserAddressList() async {
    const getUserAddressListPath = '/users/get_address_list';
    return HttpUtil().get(getUserAddressListPath);
  }

  // 删除用户地址
  static Future delAddress(int id) async {
    var delAddressPath = '/users/delete_address/${id}';
    return HttpUtil().delete(delAddressPath);
  }

  // 添加用户地址
  static Future addAddress(
      String province,
      String provinceCode,
      String city,
      String cityCode,
      String area,
      String areaCode,
      String detail,
      String mobile,
      String receiveName,
      int isDefault,
      {List valueList}) async {
    var addAddressPath = '/users/add_address';

    return HttpUtil().post(addAddressPath, data: {
      "province": province,
      "provinceCode": provinceCode,
      "city": city,
      "cityCode": cityCode,
      "area": area,
      "areaCode": areaCode,
      "detail": detail,
      "mobile": mobile,
      "receiveName": receiveName,
      "isDefault": isDefault,
      "valueList": valueList ?? []
    });
  }

  // 获取地址详情
  static Future getAddressDetailById(String id) async {
    var getAddressDetailPath = '/users/get_address/${id}';
    return HttpUtil().get(getAddressDetailPath);
  }

  // 修改用户地址
  static Future modifyAddress(
      int id,
      String province,
      String provinceCode,
      String city,
      String cityCode,
      String area,
      String areaCode,
      String detail,
      String mobile,
      String receiveName,
      int isDefault,
      {List valueList}) async {
    var addAddressPath = '/users/modify_address';
    return HttpUtil().post(addAddressPath, data: {
      "id": id,
      "province": province,
      "provinceCode": provinceCode,
      "city": city,
      "cityCode": cityCode,
      "area": area,
      "areaCode": areaCode,
      "detail": detail,
      "mobile": mobile,
      "receiveName": receiveName,
      "isDefault": isDefault,
      "valueList": valueList ?? []
    });
  }
  /**
   * 我的页面  订单数量
   */

  static Future getoreDerunpaid(String channel) {
    var url = '/user_orders/${HttpConfig.channel}/count';
    return HttpUtil().get(url);
  }
}
