class BannerEntity {
  int code;
  String msg;
  String subMsg;
  Object data;

  BannerEntity({this.code, this.msg, this.subMsg, this.data});

  BannerEntity.fromJson(Map<String, dynamic> json) {
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

class NavsEntity {
  int code;
  String msg;
  String subMsg;
  Object data;

  NavsEntity({this.code, this.msg, this.subMsg, this.data});

  NavsEntity.fromJson(Map<String, dynamic> json) {
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

// class BannerData {
// 	String imagePath;
// 	int id;
// 	int isVisible;
// 	String title;
// 	int type;
// 	String url;
// 	String desc;
// 	int order;

// 	BannerData({this.imagePath, this.id, this.isVisible, this.title, this.type, this.url, this.desc, this.order});

// 	BannerData.fromJson(Map<String, dynamic> json) {
// 		imagePath = json['imagePath'];
// 		id = json['id'];
// 		isVisible = json['isVisible'];
// 		title = json['title'];
// 		type = json['type'];
// 		url = json['url'];
// 		desc = json['desc'];
// 		order = json['order'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['imagePath'] = this.imagePath;
// 		data['id'] = this.id;
// 		data['isVisible'] = this.isVisible;
// 		data['title'] = this.title;
// 		data['type'] = this.type;
// 		data['url'] = this.url;
// 		data['desc'] = this.desc;
// 		data['order'] = this.order;
// 		return data;
// 	}
// }
