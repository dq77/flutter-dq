import 'dart:convert' show json;

class GetCategoryResp {

  int code;
  String msg;
  String subMsg;
  List<CategoryData> data;

  GetCategoryResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory GetCategoryResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new GetCategoryResp.fromJson(json.decode(jsonStr)) : new GetCategoryResp.fromJson(jsonStr);
  
  GetCategoryResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
            data.add(dataItem == null ? null : new CategoryData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"data": $data}';
  }
}

class CategoryData {

  int id;
  String name;

  CategoryData.fromParams({this.id, this.name});
  
  CategoryData.fromJson(jsonRes) {
    id = jsonRes['id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"id": $id,"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}




// 分类商品列表
class CategoryGoodsListResp {

  int code;
  String msg;
  String subMsg;
  GoodsListData data;

  CategoryGoodsListResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory CategoryGoodsListResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new CategoryGoodsListResp.fromJson(json.decode(jsonStr)) : new CategoryGoodsListResp.fromJson(jsonStr);
  
  CategoryGoodsListResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : new GoodsListData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"data": $data}';
  }
}

class GoodsListData {

  int isLast;
  int page;
  int pageSize;
  int totalCount;
  int totalPage;
  List<GoodsItem> list;

  GoodsListData.fromParams({this.isLast, this.page, this.pageSize, this.totalCount, this.totalPage, this.list});
  
  GoodsListData.fromJson(jsonRes) {
    isLast = jsonRes['isLast'];
    page = jsonRes['page'];
    pageSize = jsonRes['pageSize'];
    totalCount = jsonRes['totalCount'];
    totalPage = jsonRes['totalPage'];
    list = jsonRes['list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
            list.add(listItem == null ? null : new GoodsItem.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"isLast": $isLast,"page": $page,"pageSize": $pageSize,"totalCount": $totalCount,"totalPage": $totalPage,"list": $list}';
  }
}

class GoodsItem {

  int businessType;
  num minPrice;
  String brief;
  String headFigure;
  String name;
  String no;
  String unit;
  List<String> goodsLabel;

  GoodsItem.fromParams({this.businessType, this.minPrice, this.brief, this.headFigure, this.name, this.no, this.unit, this.goodsLabel});
  
  GoodsItem.fromJson(jsonRes) {
    businessType = jsonRes['businessType'];
    minPrice = jsonRes['minPrice'];
    brief = jsonRes['brief'];
    headFigure = jsonRes['headFigure'];
    name = jsonRes['name'];
    no = jsonRes['no'];
    unit = jsonRes['unit'];
    goodsLabel = jsonRes['goodsLabel'] == null ? null : [];

    for (var goodsLabelItem in goodsLabel == null ? [] : jsonRes['goodsLabel']){
            goodsLabel.add(goodsLabelItem);
    }
  }

  @override
  String toString() {
    return '{"businessType": $businessType,"minPrice": $minPrice,"brief": ${brief != null?'${json.encode(brief)}':'null'},"headFigure": ${headFigure != null?'${json.encode(headFigure)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"no": ${no != null?'${json.encode(no)}':'null'},"unit": ${unit != null?'${json.encode(unit)}':'null'},"goodsLabel": $goodsLabel}';
  }
}



