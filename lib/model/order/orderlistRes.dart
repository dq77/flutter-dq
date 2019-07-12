class OrderListEntity {
  int code;
  String msg;
  String subMsg;
  Object data;

  OrderListEntity({this.code, this.msg, this.subMsg, this.data});

  OrderListEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    subMsg = json['subMsg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}
