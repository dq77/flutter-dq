import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/model/goods/sku.utils.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/service/goods/index.dart';
import 'package:flutter_taozugong_app/model/goods/entity.dart';
import 'package:flutter_taozugong_app/model/goods/entity.sku.dart';
import 'package:flutter_taozugong_app/model/goods/entity.selected.dart';
import 'package:flutter_taozugong_app/model/goods/entity.coupons.dart';

import 'package:flutter_taozugong_app/utils/toast.dart';

class GoodsModel extends Model {
  
  DetailData _goodsDetail;     // 商品详情
  List<GoodsSkuData> _goodsSkuData;    // sku对应的租期列表
  List<GoodsAboutCouponsData> _goodsAboutCouponsData;  // 优惠券列表
  List<SpecificationVOList> _specificationVOList;    // sku列表
  GoodsSkuData _skuStageItem;
  
  // 以下是订单先确认页需要的数据
  bool _havedSpec = true;  // 是否多规格
  num _businessType = 0;  //售卖类型
  String _skuImg = 'https://img.taozugong.com/test/2019-03-15/20190315165028394756259.jpg';   // sku 图片，当sku有图片时显示没有去pictureList[0]
  num _amount =1; //商品数量
  Map<String, dynamic> _selectedPayType = {"name":"一次性支付","value":"1"};
  // SelectedSpecs _selectedSpecs;
  //SelectedSpec _selectedSpec;
  List<SelectedSpec> _selectedSpecs = new List<SelectedSpec>();
  String _detail = '';
  String _detailNoId = '';
  SkuStageVOList _selectedStage;

  //SelectedData _selectedData;



  String _detailPage ='详情页';

  get detailPage => _detailPage;

  get goodsDetail => _goodsDetail;
  get businessType => _businessType;
  get skuImg => _skuImg;
  get specificationVOList => _specificationVOList;
  get skuStageItem => _skuStageItem;

  get goodsSkuData => _goodsSkuData;
  get goodsAboutCouponsData => _goodsAboutCouponsData;

  //get selectedData => _selectedData;
  get amount => _amount;
  get selectedPayType => _selectedPayType;


  get selectedSpecs => _selectedSpecs;
  get havedSpec => _havedSpec;
  get detail => _detail;
  get detailNoId => _detailNoId;
  get selectedStage => _selectedStage;



  // 切换支付类型
  void changePayType(Map item){

    _selectedPayType = item;
    notifyListeners();

  }

  // 数量增加
   void add() {
    if(_amount < 10){
      _amount++;
    } else {
      Toast.show('最多10个哦！',position: 'bottom');
    }

    notifyListeners();
  }

  // 数量减少
  void reduce() {
    if (_amount > 1) {
      _amount--;
    } else {
      Toast.show('不能再减了！',position: 'bottom');
    }
    notifyListeners();
  }

  // 判断sku是否选中
  bool isChecked(item) {
    print('是否选中 $item}');
    print('是否选中 ${SkuUtil.isSelectedItem(_selectedSpecs,item)}');
    return SkuUtil.isSelectedItem(_selectedSpecs,item);
    notifyListeners();
  }

  // 切换选中规格
  void changeSkuChecked(item){
    
    print('切换选中规格 ${item.toString()}');
    for(var selSpec in _selectedSpecs){
      if(item.specificationKeyId == selSpec?.specificationKeyVO?.id){
        selSpec.specValue = item;
      }
    }

    _detail = SkuUtil.getDetail(_selectedSpecs);
    _detailNoId = SkuUtil.getDetail(_selectedSpecs,noId: true);
    
    print('切换选中规格 ${_detail.toString()}');
    // 获取默认的租期列表
    _skuStageItem = SkuUtil.getDefaultSelectedSkuStage(_detail, _goodsSkuData);
    _selectedStage = _skuStageItem?.skuStageVOList[0];

    notifyListeners();
  }
  // 租期修改
  void changeStageChecked(item){

    _selectedStage = item;
    notifyListeners();

  }
 
  // 获取商品详情
  void getGoodsDetail(String goodsNo) async {

    print('商品详情数据1 ${goodsNo}');
    var goodsDetailRes = await GoodsApiInterface.getGoodsDetail(goodsNo);
    print('商品详情数据2 ${goodsDetailRes.toString()}');
    //var goodsDetailMap = json.decode(goodsDetailRes.toString());
    var goodsDetailEntity = new GoodsDetailResp.fromJson(goodsDetailRes.data);
    print('商品详情数据3 ${goodsDetailEntity.data.toString()}');
    _goodsDetail = goodsDetailEntity.data;
    _businessType = _goodsDetail.businessType;
    _skuImg = _goodsDetail.pictureList.length>0 ? _goodsDetail.pictureList[0]:_skuImg;
    _specificationVOList = _goodsDetail.specificationVOList;

    if(_specificationVOList.length >0){
      print('已经进来了');
      _havedSpec = true;
      _selectedSpecs = await SkuUtil.getDefaultSelectedSku(_specificationVOList);
      await getGoodsSkuDetail(goodsNo);

    } else {
      print('已经进来了2');
      _havedSpec = false;
      _selectedSpecs = [];
      await getGoodsSkuDetail(goodsNo);
    }

    notifyListeners();
  }

  // 获取租期详情

  void getGoodsSkuDetail(String goodsNo) async{
    print('获取租期详情1 ${goodsNo}');
    var goodsSkuDetailRes = await GoodsApiInterface.getGoodsSkuDetailById(goodsNo);
    print('获取租期详情2 ${goodsSkuDetailRes.toString()}');
    // var goodsSkuDetailMap = json.decode(goodsSkuDetailRes.toString());
    // print('111111111 ${goodsSkuDetailRes.toString()}');
    var goodsSkuDetailEntity = new GoodsSkuResp.fromJson(goodsSkuDetailRes.data);
    print('获取租期详情3 ${goodsSkuDetailEntity.data.toString()}');
    _goodsSkuData = goodsSkuDetailEntity.data;

    if(_selectedSpecs.length > 0){
      _detailNoId = SkuUtil.getDetail(_selectedSpecs,noId:true);
      _detail = SkuUtil.getDetail(_selectedSpecs);
    } else {
      _detailNoId='';
      _detail = '';
    }
    
    // 获取默认的租期列表
    _skuStageItem = SkuUtil.getDefaultSelectedSkuStage(_detail, _goodsSkuData);
    print('_skuStageItem ${_skuStageItem.toString()}');
    _selectedStage = _skuStageItem?.skuStageVOList[0];
    print('_selectedStage ${_selectedStage.toString()}');

    notifyListeners();
    
  }


  // 获取优惠券列表
  getGoodsAboutCoupons(String goodsNo) async{
    
    print('获取商品相关优惠券1 ${goodsNo}');
    var goodsAboutCouponsRes = await GoodsApiInterface.getGoodsCoupons(goodsNo);
    print('获取商品相关优惠券2 ${goodsAboutCouponsRes.toString()}');
    var goodsAboutCouponsEntity = new GoodsAboutCouponsResp.fromJson(goodsAboutCouponsRes.data);
    print('商品相关优惠券数据3 ${goodsAboutCouponsEntity.data.toString()}');
    if(goodsAboutCouponsEntity.code == 200){
      _goodsAboutCouponsData = goodsAboutCouponsEntity.data;
    } else {
      Toast.show('${goodsAboutCouponsEntity.subMsg}',position: 'center');
    }

    notifyListeners();
    
  }


  // 领取单张优惠券
  // 40 未领取 41 已领取 42 已使用  43 已过期
  getCoupon(String couponId) async{

    // 先判断当前用户是否已经登录

    var getCouponRes = await GoodsApiInterface.getCoupons(couponId);
    print('优惠券领取 ${json.decode(getCouponRes.toString())}');
    var getCouponEntity = new GetCouponRes.fromJson(json.decode(getCouponRes.toString()));
    print('优惠券领取2 ${getCouponEntity.code.toString()}');
    if(getCouponEntity.code == 200){
      Toast.show('领取成功',position: 'bottom');
      await getGoodsAboutCoupons(_goodsDetail.no);
      
    } else {
      Toast.show('${getCouponEntity.subMsg}',position: 'bottom');
    }

    notifyListeners();

  }

  // 检查库存
  void checkSkuStock(String skuId) async{
    var checkStockRes = await GoodsApiInterface.checkSkuStock(skuId);
    print('检查库存 ${checkStockRes.toString()}');


    notifyListeners();
  }


  void selectSku() {
    
    print('sku选择');
    notifyListeners();
  }



  //GoodsModel of(context) => ScopedModel.of<GoodsModel>(context,rebuildOnChange:true);
}
