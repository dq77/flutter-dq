import 'dart:convert' show json;

// 租期列表
class GoodsSkuResp {

  num code;
  String msg;
  String subMsg;
  List<GoodsSkuData> data;

  GoodsSkuResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory GoodsSkuResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new GoodsSkuResp.fromJson(json.decode(jsonStr)) : new GoodsSkuResp.fromJson(jsonStr);
  
  GoodsSkuResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
            data.add(dataItem == null ? null : new GoodsSkuData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"data": $data}';
  }
}

class GoodsSkuData {

  num id;
  num depositPrice;
  num officialPrice;
  num salePrice;
  String detail;
  String no;
  String picture;
  List<SkuStageVOList> skuStageVOList;

  GoodsSkuData.fromParams({this.id, this.depositPrice, this.officialPrice, this.salePrice, this.detail, this.no, this.picture, this.skuStageVOList});
  
  GoodsSkuData.fromJson(jsonRes) {
    id = jsonRes['id'];
    depositPrice = jsonRes['depositPrice'];
    officialPrice = jsonRes['officialPrice'];
    salePrice = jsonRes['salePrice'];
    detail = jsonRes['detail'];
    no = jsonRes['no'];
    picture = jsonRes['picture'];
    skuStageVOList = jsonRes['skuStageVOList'] == null ? null : [];

    for (var skuStageVOListItem in skuStageVOList == null ? [] : jsonRes['skuStageVOList']){
            skuStageVOList.add(skuStageVOListItem == null ? null : new SkuStageVOList.fromJson(skuStageVOListItem));
    }
  }

  @override
  String toString() {
    return '{"id": $id,"depositPrice": $depositPrice,"officialPrice": $officialPrice,"salePrice": $salePrice,"detail": ${detail != null?'${json.encode(detail)}':'null'},"no": ${no != null?'${json.encode(no)}':'null'},"picture": ${picture != null?'${json.encode(picture)}':'null'},"skuStageVOList": $skuStageVOList}';
  }
}

class SkuStageVOList {

  num isStage;
  num stageNumber;
  num onePayPrice;
  num renewalOnePrice;
  num renewalStagePrice;
  num stagePrice;
  String unit;

  SkuStageVOList.fromParams({this.isStage, this.stageNumber, this.onePayPrice, this.renewalOnePrice, this.renewalStagePrice, this.stagePrice, this.unit});
  
  SkuStageVOList.fromJson(jsonRes) {
    isStage = jsonRes['isStage'];
    stageNumber = jsonRes['stageNumber'];
    onePayPrice = jsonRes['onePayPrice'];
    renewalOnePrice = jsonRes['renewalOnePrice'];
    renewalStagePrice = jsonRes['renewalStagePrice'];
    stagePrice = jsonRes['stagePrice'];
    unit = jsonRes['unit'];
  }

  @override
  String toString() {
    return '{"isStage": $isStage,"stageNumber": $stageNumber,"onePayPrice": $onePayPrice,"renewalOnePrice": $renewalOnePrice,"renewalStagePrice": $renewalStagePrice,"stagePrice": $stagePrice,"unit": ${unit != null?'${json.encode(unit)}':'null'}}';
  }
}




// class GoodsSkuResp {
//   num code;
//   String msg;
//   String subMsg;
//   List<GoodsSkuData> data;

//   GoodsSkuResp({this.code, this.msg, this.subMsg, this.data});

//   GoodsSkuResp.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     msg = json['msg'];
//     subMsg = json['subMsg'];
//     if (json['data'] != null) {
//       data = new List<GoodsSkuData>();
//       json['data'].forEach((v) {
//         data.add(new GoodsSkuData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['msg'] = this.msg;
//     data['subMsg'] = this.subMsg;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class GoodsSkuData {
//   num id;
//   String no;
//   String detail;
//   num officialPrice;
//   num depositPrice;
//   num salePrice;
//   List<SkuStageVOList> skuStageVOList;
//   String picture;

//   GoodsSkuData(
//       {this.id,
//       this.no,
//       this.detail,
//       this.officialPrice,
//       this.depositPrice,
//       this.salePrice,
//       this.skuStageVOList,
//       this.picture});

//   GoodsSkuData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     no = json['no'];
//     detail = json['detail'];
//     officialPrice = json['officialPrice'];
//     depositPrice = json['depositPrice'];
//     salePrice = json['salePrice'];
//     if (json['skuStageVOList'] != null) {
//       skuStageVOList = new List<SkuStageVOList>();
//       json['skuStageVOList'].forEach((v) {
//         skuStageVOList.add(new SkuStageVOList.fromJson(v));
//       });
//     }
//     picture = json['picture'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['no'] = this.no;
//     data['detail'] = this.detail;
//     data['officialPrice'] = this.officialPrice;
//     data['depositPrice'] = this.depositPrice;
//     data['salePrice'] = this.salePrice;
//     if (this.skuStageVOList != null) {
//       data['skuStageVOList'] =
//           this.skuStageVOList.map((v) => v.toJson()).toList();
//     }
//     data['picture'] = this.picture;
//     return data;
//   }
// }

// class SkuStageVOList {
//   String unit;
//   num stageNumber;
//   num onePayPrice;
//   num stagePrice;
//   num renewalOnePrice;
//   num renewalStagePrice;
//   num isStage;

//   SkuStageVOList(
//       {this.unit,
//       this.stageNumber,
//       this.onePayPrice,
//       this.stagePrice,
//       this.renewalOnePrice,
//       this.renewalStagePrice,
//       this.isStage});

//   SkuStageVOList.fromJson(Map<String, dynamic> json) {
//     unit = json['unit'];
//     stageNumber = json['stageNumber'];
//     onePayPrice = json['onePayPrice'];
//     stagePrice = json['stagePrice'];
//     renewalOnePrice = json['renewalOnePrice'];
//     renewalStagePrice = json['renewalStagePrice'];
//     isStage = json['isStage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['unit'] = this.unit;
//     data['stageNumber'] = this.stageNumber;
//     data['onePayPrice'] = this.onePayPrice;
//     data['stagePrice'] = this.stagePrice;
//     data['renewalOnePrice'] = this.renewalOnePrice;
//     data['renewalStagePrice'] = this.renewalStagePrice;
//     data['isStage'] = this.isStage;
//     return data;
//   }
// }
