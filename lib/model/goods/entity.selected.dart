import 'dart:convert' show json;
import 'package:flutter_taozugong_app/model/goods/entity.dart';
import 'package:flutter_taozugong_app/model/goods/entity.sku.dart';

// 已选规格列表

class SelectedSpecs {

  List<SelectedSpec> selectedSpecs;

  SelectedSpecs.fromParams({this.selectedSpecs});

  factory SelectedSpecs(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SelectedSpecs.fromJson(json.decode(jsonStr)) : new SelectedSpecs.fromJson(jsonStr);
  
  SelectedSpecs.fromJson(jsonRes) {
    selectedSpecs = jsonRes['selectedSpecs'] == null ? null : [];

    for (var selectedSpecsItem in selectedSpecs == null ? [] : jsonRes['selectedSpecs']){
            selectedSpecs.add(selectedSpecsItem == null ? null : new SelectedSpec.fromJson(selectedSpecsItem));
    }
  }

  @override
  String toString() {
    return '{"selectedSpecs": $selectedSpecs}';
  }
}

class SelectedSpec {

  SpecificationValueVO specValue;
  SpecificationKeyVO specificationKeyVO;

  SelectedSpec.fromParams({this.specValue, this.specificationKeyVO});
  
  SelectedSpec.fromJson(jsonRes) {
    specValue = jsonRes['specValue'] == null ? null : new SpecificationValueVO.fromJson(jsonRes['specValue']);
    specificationKeyVO = jsonRes['specificationKeyVO'] == null ? null : new SpecificationKeyVO.fromJson(jsonRes['specificationKeyVO']);
  }

  @override
  String toString() {
    return '{"specValue": $specValue,"specificationKeyVO": $specificationKeyVO}';
  }
}



class SelectedStageObjData {

  SelectedStageObj selectedStageObj;

  SelectedStageObjData.fromParams({this.selectedStageObj});

  factory SelectedStageObjData(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SelectedStageObjData.fromJson(json.decode(jsonStr)) : new SelectedStageObjData.fromJson(jsonStr);
  
  SelectedStageObjData.fromJson(jsonRes) {
    selectedStageObj = jsonRes['selectedStageObj'] == null ? null : new SelectedStageObj.fromJson(jsonRes['selectedStageObj']);
  }

  @override
  String toString() {
    return '{"selectedStageObj": $selectedStageObj}';
  }
}

class SelectedStageObj {

  int depositPrice;
  int id;
  int officialPrice;
  int salePrice;
  String detail;
  String no;
  String picture;
  SkuStageVOList stageValue;

  SelectedStageObj.fromParams({this.depositPrice, this.id, this.officialPrice, this.salePrice, this.detail, this.no, this.picture, this.stageValue});
  
  SelectedStageObj.fromJson(jsonRes) {
    depositPrice = jsonRes['depositPrice'];
    id = jsonRes['id'];
    officialPrice = jsonRes['officialPrice'];
    salePrice = jsonRes['salePrice'];
    detail = jsonRes['detail'];
    no = jsonRes['no'];
    picture = jsonRes['picture'];
    stageValue = jsonRes['stageValue'] == null ? null : new SkuStageVOList.fromJson(jsonRes['stageValue']);
  }

  @override
  String toString() {
    return '{"depositPrice": $depositPrice,"id": $id,"officialPrice": $officialPrice,"salePrice": $salePrice,"detail": ${detail != null?'${json.encode(detail)}':'null'},"no": ${no != null?'${json.encode(no)}':'null'},"picture": ${picture != null?'${json.encode(picture)}':'null'},"stageValue": $stageValue}';
  }
}


class StageValue {

  int isStage;
  int onePayPrice;
  int renewalOnePrice;
  int renewalStagePrice;
  int stageNumber;
  int stagePrice;
  String unit;

  StageValue.fromParams({this.isStage, this.onePayPrice, this.renewalOnePrice, this.renewalStagePrice, this.stageNumber, this.stagePrice, this.unit});
  
  StageValue.fromJson(jsonRes) {
    isStage = jsonRes['isStage'];
    onePayPrice = jsonRes['onePayPrice'];
    renewalOnePrice = jsonRes['renewalOnePrice'];
    renewalStagePrice = jsonRes['renewalStagePrice'];
    stageNumber = jsonRes['stageNumber'];
    stagePrice = jsonRes['stagePrice'];
    unit = jsonRes['unit'];
  }

  @override
  String toString() {
    return '{"isStage": $isStage,"onePayPrice": $onePayPrice,"renewalOnePrice": $renewalOnePrice,"renewalStagePrice": $renewalStagePrice,"stageNumber": $stageNumber,"stagePrice": $stagePrice,"unit": ${unit != null?'${json.encode(unit)}':'null'}}';
  }
}













// class SpecificationKeyVO {

//   int id;
//   int sort;
//   int status;
//   String name;
//   SpecificationKeyVO.fromParams({this.id, this.sort, this.status, this.name});
  
//   SpecificationKeyVO.fromJson(jsonRes) {
//     id = jsonRes['id'];
//     sort = jsonRes['sort'];
//     status = jsonRes['status'];
//     name = jsonRes['name'];
//   }

//   @override
//   String toString() {
//     return '{"id": $id,"sort": $sort,"status": $status,"name": ${name != null?'${json.encode(name)}':'null'}}';
//   }
// }

class SpecValue {

  int id;
  int sort;
  int specificationKeyId;
  int status;
  String name;
  String picture;

  SpecValue.fromParams({this.id, this.sort, this.specificationKeyId, this.status, this.name, this.picture});
  
  SpecValue.fromJson(jsonRes) {
    id = jsonRes['id'];
    sort = jsonRes['sort'];
    specificationKeyId = jsonRes['specificationKeyId'];
    status = jsonRes['status'];
    name = jsonRes['name'];
    picture = jsonRes['picture'];
  }

  @override
  String toString() {
    return '{"id": $id,"sort": $sort,"specificationKeyId": $specificationKeyId,"status": $status,"name": ${name != null?'${json.encode(name)}':'null'},"picture": ${picture != null?'${json.encode(picture)}':'null'}}';
  }
}


