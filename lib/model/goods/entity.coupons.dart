import 'dart:convert' show json;

class GoodsAboutCouponsResp {

  int code;
  String msg;
  String subMsg;
  List<GoodsAboutCouponsData> data;

  GoodsAboutCouponsResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory GoodsAboutCouponsResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new GoodsAboutCouponsResp.fromJson(json.decode(jsonStr)) : new GoodsAboutCouponsResp.fromJson(jsonStr);
  
  GoodsAboutCouponsResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
            data.add(dataItem == null ? null : new GoodsAboutCouponsData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"data": $data}';
  }
}

class GoodsAboutCouponsData {

  int couponDay;
  int useStatus;
  String validEndTime;
  String validStartTime;
  int couponType;
  int id;
  int payType;
  double couponMoney;
  double spendMoney;
  String couponName;

  GoodsAboutCouponsData.fromParams({this.couponDay, this.useStatus, this.validEndTime, this.validStartTime, this.couponType, this.id, this.payType, this.couponMoney, this.spendMoney, this.couponName});
  
  GoodsAboutCouponsData.fromJson(jsonRes) {
    couponDay = jsonRes['couponDay'];
    useStatus = jsonRes['useStatus'];
    validEndTime = jsonRes['validEndTime'];
    validStartTime = jsonRes['validStartTime'];
    couponType = jsonRes['couponType'];
    id = jsonRes['id'];
    payType = jsonRes['payType'];
    couponMoney = jsonRes['couponMoney'];
    spendMoney = jsonRes['spendMoney'];
    couponName = jsonRes['couponName'];
  }

  @override
  String toString() {
    return '{"couponDay": $couponDay,"useStatus": $useStatus,"validEndTime": ${validEndTime != null?'${json.encode(validEndTime)}':'null'},"validStartTime": ${validStartTime != null?'${json.encode(validStartTime)}':'null'},"couponType": $couponType,"id": $id,"payType": $payType,"couponMoney": $couponMoney,"spendMoney": $spendMoney,"couponName": ${couponName != null?'${json.encode(couponName)}':'null'}}';
  }
}


class GetCouponRes {

  int code;
  String data;
  String msg;
  String subMsg;

  GetCouponRes.fromParams({this.code, this.data, this.msg, this.subMsg});

  factory GetCouponRes(jsonStr) => jsonStr == null ? null : jsonStr is String ? new GetCouponRes.fromJson(json.decode(jsonStr)) : new GetCouponRes.fromJson(jsonStr);
  
  GetCouponRes.fromJson(jsonRes) {
    code = jsonRes['code'];
    data = jsonRes['data'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
  }

  @override
  String toString() {
    return '{"code": $code,"data": ${data != null?'${json.encode(data)}':'null'},"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'}}';
  }
}



