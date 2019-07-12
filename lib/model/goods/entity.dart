import 'dart:convert' show json;

class GoodsDetailResp {

  num code;
  String msg;
  String subMsg;
  DetailData data;

  GoodsDetailResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory GoodsDetailResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new GoodsDetailResp.fromJson(json.decode(jsonStr)) : new GoodsDetailResp.fromJson(jsonStr);
  
  GoodsDetailResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : new DetailData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"data": $data}';
  }
}

class DetailData {

  String alipayCode;
  num businessType;
  num isAuthentication;
  num isFace;
  num maxPrice;
  num minPrice;
  num officialPrice;
  String brief;
  String name;
  String no;
  String unit;
  String video;
  List<String> afterSaleList;
  List<String> detail;
  List<String> goodsLabelList;
  List<String> parameterList;
  List<dynamic> payTypeList;
  List<String> pictureList;
  List<SpecificationVOList> specificationVOList;

  DetailData.fromParams({this.alipayCode, this.businessType, this.isAuthentication, this.isFace, this.maxPrice, this.minPrice, this.officialPrice, this.brief, this.name, this.no, this.unit, this.video, this.afterSaleList, this.detail, this.goodsLabelList, this.parameterList, this.payTypeList, this.pictureList, this.specificationVOList});
  
  DetailData.fromJson(jsonRes) {
    alipayCode = jsonRes['alipayCode'];
    businessType = jsonRes['businessType'];
    isAuthentication = jsonRes['isAuthentication'];
    isFace = jsonRes['isFace'];
    maxPrice = jsonRes['maxPrice'];
    minPrice = jsonRes['minPrice'];
    officialPrice = jsonRes['officialPrice'];
    brief = jsonRes['brief'];
    name = jsonRes['name'];
    no = jsonRes['no'];
    unit = jsonRes['unit'];
    video = jsonRes['video'];
    afterSaleList = jsonRes['afterSaleList'] == null ? null : [];

    for (var afterSaleListItem in afterSaleList == null ? [] : jsonRes['afterSaleList']){
            afterSaleList.add(afterSaleListItem);
    }

    detail = jsonRes['detail'] == null ? null : [];

    for (var detailItem in detail == null ? [] : jsonRes['detail']){
            detail.add(detailItem);
    }

    goodsLabelList = jsonRes['goodsLabelList'] == null ? null : [];

    for (var goodsLabelListItem in goodsLabelList == null ? [] : jsonRes['goodsLabelList']){
            goodsLabelList.add(goodsLabelListItem);
    }

    parameterList = jsonRes['parameterList'] == null ? null : [];

    for (var parameterListItem in parameterList == null ? [] : jsonRes['parameterList']){
            parameterList.add(parameterListItem);
    }

    payTypeList = jsonRes['payTypeList'] == null ? null : [];

    for (var payTypeListItem in payTypeList == null ? [] : jsonRes['payTypeList']){
            payTypeList.add(payTypeListItem);
    }

    pictureList = jsonRes['pictureList'] == null ? null : [];

    for (var pictureListItem in pictureList == null ? [] : jsonRes['pictureList']){
            pictureList.add(pictureListItem);
    }

    specificationVOList = jsonRes['specificationVOList'] == null ? null : [];

    for (var specificationVOListItem in specificationVOList == null ? [] : jsonRes['specificationVOList']){
            specificationVOList.add(specificationVOListItem == null ? null : new SpecificationVOList.fromJson(specificationVOListItem));
    }
  }

  @override
  String toString() {
    return '{"alipayCode": ${alipayCode != null?'${json.encode(alipayCode)}':'null'},"businessType": $businessType,"isAuthentication": $isAuthentication,"isFace": $isFace,"maxPrice": $maxPrice,"minPrice": $minPrice,"officialPrice": $officialPrice,"brief": ${brief != null?'${json.encode(brief)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"no": ${no != null?'${json.encode(no)}':'null'},"unit": ${unit != null?'${json.encode(unit)}':'null'},"video": ${video != null?'${json.encode(video)}':'null'},"afterSaleList": $afterSaleList,"detail": $detail,"goodsLabelList": $goodsLabelList,"parameterList": $parameterList,"payTypeList": $payTypeList,"pictureList": $pictureList,"specificationVOList": $specificationVOList}';
  }
}

class SpecificationVOList {

  List<SpecificationValueVO> specificationValueVOList;
  SpecificationKeyVO specificationKeyVO;

  SpecificationVOList.fromParams({this.specificationValueVOList, this.specificationKeyVO});
  
  SpecificationVOList.fromJson(jsonRes) {
    specificationValueVOList = jsonRes['specificationValueVOList'] == null ? null : [];

    for (var specificationValueVOListItem in specificationValueVOList == null ? [] : jsonRes['specificationValueVOList']){
            specificationValueVOList.add(specificationValueVOListItem == null ? null : new SpecificationValueVO.fromJson(specificationValueVOListItem));
    }

    specificationKeyVO = jsonRes['specificationKeyVO'] == null ? null : new SpecificationKeyVO.fromJson(jsonRes['specificationKeyVO']);
  }

  @override
  String toString() {
    return '{"specificationValueVOList": $specificationValueVOList,"specificationKeyVO": $specificationKeyVO}';
  }
}

class SpecificationKeyVO {

  num id;
  num sort;
  num status;
  String name;

  SpecificationKeyVO.fromParams({this.id, this.sort, this.status, this.name});
  
  SpecificationKeyVO.fromJson(jsonRes) {
    id = jsonRes['id'];
    sort = jsonRes['sort'];
    status = jsonRes['status'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"id": $id,"sort": $sort,"status": $status,"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class SpecificationValueVO {

  String picture;
  num id;
  num sort;
  num specificationKeyId;
  num status;
  String name;

  SpecificationValueVO.fromParams({this.picture, this.id, this.sort, this.specificationKeyId, this.status, this.name});
  
  SpecificationValueVO.fromJson(jsonRes) {
    picture = jsonRes['picture'];
    id = jsonRes['id'];
    sort = jsonRes['sort'];
    specificationKeyId = jsonRes['specificationKeyId'];
    status = jsonRes['status'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"picture": ${picture != null?'${json.encode(picture)}':'null'},"id": $id,"sort": $sort,"specificationKeyId": $specificationKeyId,"status": $status,"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

