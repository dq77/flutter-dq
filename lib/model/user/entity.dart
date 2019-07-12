import 'dart:convert' show json;

class UserInfoResp {
  int code;
  String msg;
  String subMsg;
  UserInfoData data;

  UserInfoResp({this.code, this.msg, this.subMsg, this.data});

  UserInfoResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    subMsg = json['subMsg'];
    data =
        json['data'] != null ? new UserInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['subMsg'] = this.subMsg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class UserInfoData {
  int uid;
  String username;
  String mobile;
  String channel;
  int isTest;
  int isVip;
  int status;
  String extend;
  String ip;
  int isPass;
  String lastTime;
  String lastIp;
  String gmtCreate;
  String gmtModified;
  int isDelete;
  String balance;

  UserInfoData(
      {this.uid,
      this.username,
      this.mobile,
      this.channel,
      this.isTest,
      this.isVip,
      this.status,
      this.extend,
      this.ip,
      this.isPass,
      this.lastTime,
      this.lastIp,
      this.gmtCreate,
      this.gmtModified,
      this.isDelete,
      this.balance});

  UserInfoData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    mobile = json['mobile'];
    channel = json['channel'];
    isTest = json['isTest'];
    isVip = json['isVip'];
    status = json['status'];
    extend = json['extend'];
    ip = json['ip'];
    isPass = json['isPass'];
    lastTime = json['lastTime'];
    lastIp = json['lastIp'];
    gmtCreate = json['gmtCreate'];
    gmtModified = json['gmtModified'];
    isDelete = json['isDelete'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['channel'] = this.channel;
    data['isTest'] = this.isTest;
    data['isVip'] = this.isVip;
    data['status'] = this.status;
    data['extend'] = this.extend;
    data['ip'] = this.ip;
    data['isPass'] = this.isPass;
    data['lastTime'] = this.lastTime;
    data['lastIp'] = this.lastIp;
    data['gmtCreate'] = this.gmtCreate;
    data['gmtModified'] = this.gmtModified;
    data['isDelete'] = this.isDelete;
    data['balance'] = this.balance;
    return data;
  }
}

// 地址列表
class AddressListResp {
  int code;
  String msg;
  String subMsg;
  List<AddressListData> data;

  AddressListResp.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory AddressListResp(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new AddressListResp.fromJson(json.decode(jsonStr))
          : new AddressListResp.fromJson(jsonStr);

  AddressListResp.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(
          dataItem == null ? null : new AddressListData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"subMsg": ${subMsg != null ? '${json.encode(subMsg)}' : 'null'},"data": $data}';
  }
}

class AddressListData {
  int id;
  int isDefault;
  int userId;
  String area;
  String areaCode;
  String city;
  String cityCode;
  String detail;
  String mobile;
  String province;
  String provinceCode;
  String receiveName;
  String zipCode;
  List<String> valueList;

  AddressListData.fromParams(
      {this.id,
      this.isDefault,
      this.userId,
      this.area,
      this.areaCode,
      this.city,
      this.cityCode,
      this.detail,
      this.mobile,
      this.province,
      this.provinceCode,
      this.receiveName,
      this.zipCode,
      this.valueList});

  AddressListData.fromJson(jsonRes) {
    id = jsonRes['id'];
    isDefault = jsonRes['isDefault'];
    userId = jsonRes['userId'];
    area = jsonRes['area'];
    areaCode = jsonRes['areaCode'];
    city = jsonRes['city'];
    cityCode = jsonRes['cityCode'];
    detail = jsonRes['detail'];
    mobile = jsonRes['mobile'];
    province = jsonRes['province'];
    provinceCode = jsonRes['provinceCode'];
    receiveName = jsonRes['receiveName'];
    zipCode = jsonRes['zipCode'];
    valueList = jsonRes['valueList'] == null ? null : [];

    for (var valueListItem in valueList == null ? [] : jsonRes['valueList']) {
      valueList.add(valueListItem);
    }
  }

  @override
  String toString() {
    return '{"id": $id,"isDefault": $isDefault,"userId": $userId,"area": ${area != null ? '${json.encode(area)}' : 'null'},"areaCode": ${areaCode != null ? '${json.encode(areaCode)}' : 'null'},"city": ${city != null ? '${json.encode(city)}' : 'null'},"cityCode": ${cityCode != null ? '${json.encode(cityCode)}' : 'null'},"detail": ${detail != null ? '${json.encode(detail)}' : 'null'},"mobile": ${mobile != null ? '${json.encode(mobile)}' : 'null'},"province": ${province != null ? '${json.encode(province)}' : 'null'},"provinceCode": ${provinceCode != null ? '${json.encode(provinceCode)}' : 'null'},"receiveName": ${receiveName != null ? '${json.encode(receiveName)}' : 'null'},"zipCode": ${zipCode != null ? '${json.encode(zipCode)}' : 'null'},"valueList": $valueList}';
  }
}

// 获取订单状态的数量
class OrderStatusNumRes {
  int code;
  String msg;
  String subMsg;
  List<OrderStatusNumRes_Data> data;

  OrderStatusNumRes({this.code, this.msg, this.subMsg, this.data});

  OrderStatusNumRes.fromJson(Map<String, dynamic> json) {
    print('${json}');
    code = json['code'];
    msg = json['msg'];
    subMsg = json['subMsg'];
    if (json['data'] != null) {
      data = new List<OrderStatusNumRes_Data>();
      json['data'].forEach((v) {
        data.add(new OrderStatusNumRes_Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['subMsg'] = this.subMsg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// 地址信息
class AddressInfoRes {
  int code;
  String msg;
  String subMsg;
  AddressInfoData data;

  AddressInfoRes.fromParams({this.code, this.msg, this.subMsg, this.data});

  factory AddressInfoRes(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new AddressInfoRes.fromJson(json.decode(jsonStr))
          : new AddressInfoRes.fromJson(jsonStr);

  AddressInfoRes.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    subMsg = jsonRes['subMsg'];
    data = jsonRes['data'] == null
        ? null
        : new AddressInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"subMsg": ${subMsg != null ? '${json.encode(subMsg)}' : 'null'},"data": $data}';
  }
}

class AddressInfoData {
  int id;
  int isDefault;
  int userId;
  String area;
  String areaCode;
  String city;
  String cityCode;
  String detail;
  String mobile;
  String province;
  String provinceCode;
  String receiveName;
  String zipCode;
  List<String> valueList;

  AddressInfoData.fromParams(
      {this.id,
      this.isDefault,
      this.userId,
      this.area,
      this.areaCode,
      this.city,
      this.cityCode,
      this.detail,
      this.mobile,
      this.province,
      this.provinceCode,
      this.receiveName,
      this.zipCode,
      this.valueList});

  AddressInfoData.fromJson(jsonRes) {
    id = jsonRes['id'];
    isDefault = jsonRes['isDefault'];
    userId = jsonRes['userId'];
    area = jsonRes['area'];
    areaCode = jsonRes['areaCode'];
    city = jsonRes['city'];
    cityCode = jsonRes['cityCode'];
    detail = jsonRes['detail'];
    mobile = jsonRes['mobile'];
    province = jsonRes['province'];
    provinceCode = jsonRes['provinceCode'];
    receiveName = jsonRes['receiveName'];
    zipCode = jsonRes['zipCode'];
    valueList = jsonRes['valueList'] == null ? null : [];

    for (var valueListItem in valueList == null ? [] : jsonRes['valueList']) {
      valueList.add(valueListItem);
    }
  }

  @override
  String toString() {
    return '{"id": $id,"isDefault": $isDefault,"userId": $userId,"area": ${area != null ? '${json.encode(area)}' : 'null'},"areaCode": ${areaCode != null ? '${json.encode(areaCode)}' : 'null'},"city": ${city != null ? '${json.encode(city)}' : 'null'},"cityCode": ${cityCode != null ? '${json.encode(cityCode)}' : 'null'},"detail": ${detail != null ? '${json.encode(detail)}' : 'null'},"mobile": ${mobile != null ? '${json.encode(mobile)}' : 'null'},"province": ${province != null ? '${json.encode(province)}' : 'null'},"provinceCode": ${provinceCode != null ? '${json.encode(provinceCode)}' : 'null'},"receiveName": ${receiveName != null ? '${json.encode(receiveName)}' : 'null'},"zipCode": ${zipCode != null ? '${json.encode(zipCode)}' : 'null'},"valueList": $valueList}';
  }
}

class OrderStatusNumRes_Data {
  int status;
  int num;

  OrderStatusNumRes_Data({this.status, this.num});

  OrderStatusNumRes_Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['num'] = this.num;
    return data;
  }
}
