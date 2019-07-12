import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/service/goods/index.dart';
import 'package:flutter_taozugong_app/model/category/entity.dart';

import 'package:flutter_taozugong_app/utils/toast.dart';

class CategoryModel extends Model {
  
  List<CategoryData> _categoryData;
  int _defaultCategoryId;

  GoodsListData _goodsListInfo;
  List<GoodsItem> _goodsList;
  int _isLast = 0;  // 默认0 为不是最后一页  1 为最后一页
  int _totalCount; // 总数量
  int _page;   //当前页


  get categoryData => _categoryData;
  get defaultCategoryId => _defaultCategoryId;
  get goodsListInfo => _goodsListInfo;
  get goodsList => _goodsList;
  get isLast => _isLast;
  get totalCount => _totalCount;
  get page => _page;


  /// 获取分类
  void getCategoryList() async {

    print('获取商品分类');
    var goodsCategoryRes = await GoodsApiInterface.getGoodsCategoryList();
    print('获取商品分类1 ${goodsCategoryRes.toString()}');
    var goodsCategoryEntity = new GetCategoryResp.fromJson(goodsCategoryRes.data);
    print('获取商品分类2 ${goodsCategoryEntity.toString()}');
    // _categoryData = goodsCategoryEntity.data;
    // print('商品分类 ${_categoryData.toString()}');
    if(goodsCategoryEntity.code == 200){
      _categoryData = goodsCategoryEntity.data;
      // 获取默认的分类id
      _defaultCategoryId = _categoryData[0]?.id;
      // 获取当前分类下的商品列表
      await getGoodsListByCategoryId(_defaultCategoryId);
    } else {
      Toast.show('${goodsCategoryEntity.subMsg}',position: 'bottom');
    }

    notifyListeners();
  }

  // 改变默认defaultCategoryId
  void changeDefaultCategoryId(int id) async{

    _defaultCategoryId = id;
    await getGoodsListByCategoryId(_defaultCategoryId);

    notifyListeners();

  }

  // 根据分类ID获取商品列表
  void getGoodsListByCategoryId(int id) async{

    print('获取默认分类下的商品列表 ${id}');
    var categoryGoodsListRes = await GoodsApiInterface.getGoodsByCategoryId(channelCategoryId: id, page: 1, pageSize: 10);
    print('获取默认分类下的商品列表1 ${categoryGoodsListRes.toString()}');
    var categoryGoodsListEntity = new CategoryGoodsListResp.fromJson(categoryGoodsListRes); 
    print('获取默认分类下的商品列表2 ${categoryGoodsListEntity.toString()}');

    if(categoryGoodsListEntity.code == 200){

      _goodsListInfo = categoryGoodsListEntity.data;
      _goodsList = _goodsListInfo?.list;
      _totalCount = _goodsListInfo.totalCount;
      _page = _goodsListInfo.page;
      _isLast = _goodsListInfo.isLast;

    } else {
      Toast.show('${categoryGoodsListEntity.subMsg}');
    }

    print('获取默认分类下的商品列表3 ${categoryGoodsListEntity.data.list.toString()}');

    notifyListeners();

  }


  //CategoryModel of(context) => ScopedModel.of<CategoryModel>(context,rebuildOnChange:true);
}
