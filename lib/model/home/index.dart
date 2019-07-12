import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/service/home/index.dart';
import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:flutter_taozugong_app/service/goods/index.dart';
import 'package:flutter_taozugong_app/model/home/entity.dart';

class HomeModel extends Model {
  List _bannerList = [];
  List _navsList = [];
  List _selectionList = [];
  List _goodsCategoryList =[];

  // 用户信息
  //Map<String,dynamic> _userInfo = {};

  get bannerList => _bannerList;
  get navsList => _navsList;
  get selectionList => _selectionList;
  get goodsCategoryList => _goodsCategoryList;
  //get userInfo => _userInfo;

  // 获取banner列表
  void getBannerList() async {
    print('我调用了请求banner的接口');
    // HomeApiInterface.getData();

    var bannerRes = await HomeApiInterface.getBannerList('5');
    var bannerMap = json.decode(bannerRes.toString());
    var bannerEntity = new BannerEntity.fromJson(bannerMap);
    print('等待返回结果3 ${bannerEntity.data.toString()}');
    _bannerList = bannerEntity.data;

    notifyListeners();
  }

  /// 获取导航入口
  void getNavsEntryList() async {
    var navRes = await HomeApiInterface.getNavList(channel: 'ALIPAY_LIFE');
    var navsMap = json.decode(navRes.toString());
    var navsEntity = new NavsEntity.fromJson(navsMap);
    _navsList = navsEntity.data;
    print('等待返回结果2 ${navRes.data.toString()}');
    notifyListeners();
  }

  void getSelection() async {
    var selectionRes = await HomeApiInterface.getSelectionsList();
    //var selectionMap = json.decode(selectionRes.toString());
    _selectionList = selectionRes.data['data'];
    print('等待返回结果selectionRes ${selectionRes.data['data'][0].toString()}');

    notifyListeners();
  }

  /// 获取用户信息
  // void getUserInfo() async{
  //   var userInfoRes = await UserApiInterface.getUserInfo();
  //   print('用户信息 ${userInfoRes.toString()}');
  // }


  /// 获取分类
  void getGoodsCategoryList() async {
    print('获取商品分类');
    var goodsCategoryRes = await GoodsApiInterface.getGoodsCategoryList();
    _goodsCategoryList = goodsCategoryRes.data['data'];
    print('商品分类 ${_goodsCategoryList.toString()}');

    notifyListeners();
  }
  

  HomeModel of(context) => ScopedModel.of<HomeModel>(context,rebuildOnChange:true);
}
