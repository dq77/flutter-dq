import 'dart:convert' show json;

// 获取订单确认数据
class GetConfirmDataResp {

  num code;
  String msg;
  String subMsg;
  OrderConfirmData data;

  GetConfirmDataResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory GetConfirmDataResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new GetConfirmDataResp.fromJson(json.decode(jsonStr)) : new GetConfirmDataResp.fromJson(jsonStr);
  
  GetConfirmDataResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : new OrderConfirmData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"data": $data}';
  }
}

class OrderConfirmData {

  num firstPay;
  num totalRent;
  num deposit;
  num freeDeposit;
  num totalDeposit;
  List<CouponListData> couponList;
  OrderBackVo orderBackVo;

  OrderConfirmData.fromParams({this.firstPay, this.totalRent, this.deposit, this.freeDeposit, this.totalDeposit, this.couponList, this.orderBackVo});
  
  OrderConfirmData.fromJson(jsonRes) {
    firstPay = jsonRes['firstPay'];
    totalRent = jsonRes['totalRent'];
    deposit = jsonRes['deposit'];
    freeDeposit = jsonRes['freeDeposit'];
    totalDeposit = jsonRes['totalDeposit'];
    couponList = jsonRes['couponList'] == null ? null : [];

    for (var couponListItem in couponList == null ? [] : jsonRes['couponList']){
            couponList.add(couponListItem == null ? null : new CouponListData.fromJson(couponListItem));
    }

    orderBackVo = jsonRes['orderBackVo'] == null ? null : new OrderBackVo.fromJson(jsonRes['orderBackVo']);
  }

  @override
  String toString() {
    return '{"firstPay": $firstPay,"totalRent": $totalRent,"deposit": $deposit,"freeDeposit": $freeDeposit,"totalDeposit": $totalDeposit,"couponList": $couponList,"orderBackVo": $orderBackVo}';
  }
}

class OrderBackVo {

  num backPercent;
  num id;

  OrderBackVo.fromParams({this.backPercent, this.id});
  
  OrderBackVo.fromJson(jsonRes) {
    backPercent = jsonRes['backPercent'];
    id = jsonRes['id'];
  }

  @override
  String toString() {
    return '{"backPercent": $backPercent,"id": $id}';
  }
}

class CouponListData {

  num couponDay;
  num couponType;
  num id;
  num payType;
  num useStatus;
  num couponMoney;
  num spendMoney;
  String couponName;
  String validEndTime;
  String validStartTime;

  CouponListData.fromParams({this.couponDay, this.couponType, this.id, this.payType, this.useStatus, this.couponMoney, this.spendMoney, this.couponName, this.validEndTime, this.validStartTime});
  
  CouponListData.fromJson(jsonRes) {
    couponDay = jsonRes['couponDay'];
    couponType = jsonRes['couponType'];
    id = jsonRes['id'];
    payType = jsonRes['payType'];
    useStatus = jsonRes['useStatus'];
    couponMoney = jsonRes['couponMoney'];
    spendMoney = jsonRes['spendMoney'];
    couponName = jsonRes['couponName'];
    validEndTime = jsonRes['validEndTime'];
    validStartTime = jsonRes['validStartTime'];
  }

  @override
  String toString() {
    return '{"couponDay": $couponDay,"couponType": $couponType,"id": $id,"payType": $payType,"useStatus": $useStatus,"couponMoney": $couponMoney,"spendMoney": $spendMoney,"couponName": ${couponName != null?'${json.encode(couponName)}':'null'},"validEndTime": ${validEndTime != null?'${json.encode(validEndTime)}':'null'},"validStartTime": ${validStartTime != null?'${json.encode(validStartTime)}':'null'}}';
  }
}


// 创建订单返回值
class CreateOrderResp {

  String subMsg;
  int code;
  String msg;
  CreateOrderData data;

  CreateOrderResp.fromParams({this.subMsg, this.code, this.msg, this.data});

  factory CreateOrderResp(jsonStr) => jsonStr == null ? null : jsonStr is String ? new CreateOrderResp.fromJson(json.decode(jsonStr)) : new CreateOrderResp.fromJson(jsonStr);
  
  CreateOrderResp.fromJson(jsonRes) {
    subMsg = jsonRes['subMsg'];
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : new CreateOrderData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"subMsg": ${subMsg != null?'${json.encode(subMsg)}':'null'},"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class CreateOrderData {

  bool isContinue;
  String orderNo;
  String orderStr;

  CreateOrderData.fromParams({this.isContinue, this.orderNo, this.orderStr});
  
  CreateOrderData.fromJson(jsonRes) {
    isContinue = jsonRes['isContinue'];
    orderNo = jsonRes['orderNo'];
    orderStr = jsonRes['orderStr'];
  }

  @override
  String toString() {
    return '{"isContinue": $isContinue,"orderNo": ${orderNo != null?'${json.encode(orderNo)}':'null'},"orderStr": ${orderStr != null?'${json.encode(orderStr)}':'null'}}';
  }
}



