import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:flutter_taozugong_app/model/user/entity.dart';

import 'package:flutter_taozugong_app/utils/toast.dart';

class UserModel extends Model {
  List _bannerList = [];
  List _addressList = [];
  List _orderStatusNumlist = [];
  UserInfoData _userInfo;
  AddressInfoData _addressInfo;
  AddressListData _orderDefaultAddress;

  get bannerList => _bannerList;
  get userInfo => _userInfo;
  get addressList => _addressList;
  get orderStatusNumlist => _orderStatusNumlist;
  get addressInfo => _addressInfo;
  get orderDefaultAddress => _orderDefaultAddress;

  // 获取验证码
  void getAuthCode(String mobile, String businessType) async {
    var authCodeRes =
        await UserApiInterface.userGetAuthCode(mobile, businessType);
    print('等待返回结果3 ${authCodeRes.data.toString()}');
    _bannerList = authCodeRes.data;
    notifyListeners();
  }

  /// 登录
  void userLoginIn(String mobile) {
    final res = UserApiInterface.userLogin(mobile);
    debugPrint('接口返回信息 $res');
  }

  /// 获取用户信息
  void getUserInfo() async {
    print('获取用户信息接口');
    var userInfoRes = await UserApiInterface.getUserInfo();
    print('用户信息1 ${userInfoRes.data.toString()}');
    //var userInfoMap = json.decode(userInfoRes.data.toString());
    var userInfoEntity = new UserInfoResp.fromJson(userInfoRes.data);
    if (userInfoEntity.code == 200) {
      print('用户信息2 ${userInfoEntity.toJson()}');
      _userInfo = userInfoEntity.data;
      print('用户姓名 ${_userInfo.username}');
      print('用户电话 ${_userInfo.mobile}');
    } else {
      Toast.show('${userInfoEntity.subMsg}', position: 'bottom');
    }

    notifyListeners();
  }

  // 改变选取的地址
  void changeSelectedAddress(item) {
    _orderDefaultAddress = item;
    notifyListeners();
  }

  // 获取地址列表
  void getUserAddressList() async {
    print('获取地址列表');
    var addressListRes = await UserApiInterface.getUserAddressList();
    print('获取地址列表1 ${addressListRes.toString()}');
    var addressListEntity = new AddressListResp.fromJson(addressListRes.data);
    print('获取地址列表2 ${addressListEntity.data.toString()}');
    if (addressListEntity.code == 200) {
      _addressList = addressListEntity.data;
      _orderDefaultAddress =
          _addressList.firstWhere((item) => (item.isDefault == 1));

      print('默认地址 ${_orderDefaultAddress.toString()}');
    } else {
      Toast.show('${addressListEntity.subMsg}', position: 'bottom');
    }

    notifyListeners();
  }

  // 添加地址
  void addAddress(
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
    print('添加地址');
    var addAddressRes = await UserApiInterface.addAddress(
        province,
        provinceCode,
        city,
        cityCode,
        area,
        areaCode,
        detail,
        mobile,
        receiveName,
        isDefault);

    if (addAddressRes['code'] == 200) {
      getUserAddressList();
      Toast.show('添加成功');
    }
    print('默认地址 ${addAddressRes['code'].toString()}');
    notifyListeners();
  }

  // 获取地址详情
  void getAddressInfo(String id) async {
    var addressInfoRes = await UserApiInterface.getAddressDetailById(id);
    var addressInfoEntity = new AddressInfoRes.fromJson(addressInfoRes.data);
    _addressInfo = addressInfoEntity.data;
    print('地址详情1 ${addressInfoEntity.data.toString()}');
    print('地址详情2 ${addressInfoRes.toString()}');

    notifyListeners();
  }

  // 修改地址
  void modifyAddress(
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
    print('修改地址');

    var modifyAddressRes = await UserApiInterface.modifyAddress(
        id,
        province,
        provinceCode,
        city,
        cityCode,
        area,
        areaCode,
        detail,
        mobile,
        receiveName,
        isDefault);
    if (modifyAddressRes['code'] == 200) {
      getUserAddressList();
      Toast.show('修改成功');
    }

    notifyListeners();
  }

  // 删除地址
  void deleteAddress(int id) async {
    print('删除地址');
    var delAddressRes = await UserApiInterface.delAddress(id);
    if (delAddressRes['code'] == 200) {
      getUserAddressList();
      Toast.show('删除成功');
    }

    notifyListeners();
  }

// 获取不同状态的订单数量
  void getoreDerunpaid({String channel}) async {
    print('获取不同状态的订单数量');
    var orderNumState = await UserApiInterface.getoreDerunpaid(channel);
    print('获取到的订单状态数据1:${orderNumState.toString()}');
    var orderStatusNum = new OrderStatusNumRes.fromJson(orderNumState.data);
    print('获取到的订单状态数据2: ${orderStatusNum.toJson()}');
    if (orderStatusNum.code == 200) {
      _orderStatusNumlist = orderStatusNum.data;
      print('获取到的订单状态数据: ${orderStatusNum.toJson()}');
    }
    notifyListeners();
  }

  // HomeModel of(context) => ScopedModel.of<HomeModel>(context,rebuildOnChange:true);
}
