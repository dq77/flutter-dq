import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class NetUtil {
  static final debug = true;
  static BuildContext context = null;
  static final host = 'https://api.taozugong.cn.';
  static final baseUrl = HttpConfig.url;

  // ignore: argument_type_not_assignable
  static final Dio _dio = new Dio(new BaseOptions(
      method: "get",
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true));

  /// 代理设置，方便抓包来进行接口调节
//  static void setProxy() {
//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//      // config the http client
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY localhost:8888";
//      };
//      // you can also create a new HttpClient to dio
//      // return new HttpClient();
//    };
//  }

  static String token;

  static final LogicError unknowError = LogicError(-1, "未知异常");

  static Future<Map<String, dynamic>> getJson<T>(
      String uri, Map<String, dynamic> paras) {

    print('getJson 方法进入 ${paras.toString()}');
    _httpJson("get", uri, data: paras).then(logicalErrorTransform);
  }


  static Future<Map<String, dynamic>> getForm<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("get", uri, data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 表单方式的post
  static Future<Map<String, dynamic>> postForm<T>(
      String uri, Map<String, dynamic> paras) =>
      _httpJson("post", uri, data: paras, dataIsJson: false)
          .then(logicalErrorTransform);

  /// requestBody (json格式参数) 方式的 post
  static Future<Map<String, dynamic>> postJson(
      String uri, Map<String, dynamic> body) =>
      _httpJson("post", uri, data: body).then(logicalErrorTransform);

  static Future<Map<String, dynamic>> deleteJson<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("delete", uri, data: body).then(logicalErrorTransform);

  /// requestBody (json格式参数) 方式的 put
  static Future<Map<String, dynamic>> putJson<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("put", uri, data: body).then(logicalErrorTransform);

  /// 表单方式的 put
  static Future<Map<String, dynamic>> putForm<T>(
      String uri, Map<String, dynamic> body) =>
      _httpJson("put", uri, data: body, dataIsJson: false)
          .then(logicalErrorTransform);

  /// 文件上传  返回json数据为字符串
  static Future<T> putFile<T>(String uri, String filePath) {
    var name =
    filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = new FormData.from({
      "multipartFile": new UploadFileInfo(new File(filePath), name,
          contentType: ContentType.parse("image/$suffix"))
    });

    var enToken = token == null ? "" : Uri.encodeFull(token);
    return _dio
        .put<Map<String, dynamic>>("$uri?token=$enToken", data: formData)
        .then(logicalErrorTransform);
  }

  static Future<Response<Map<String, dynamic>>> _httpJson(
      String method, String uri,
      {Map<String, dynamic> data, bool dataIsJson = true}) {
    var enToken = token == null ? "" : Uri.encodeFull(token);

    /// 如果为 get方法，则进行参数拼接
    if (method == "get") {
      dataIsJson = false;
      if (data == null) {
        data = new Map<String, dynamic>();
      }
//      data["token"] = token;
    }

    if (debug) {
      print('<net url>------$uri');
      print('<net params>------$data');
    }

    /// 根据当前 请求的类型来设置 如果是请求体形式则使用json格式
    /// 否则则是表单形式的（拼接在url上）
    Options op;
    if (dataIsJson) {
      print('<op>------application/json');
      op = new Options(contentType: ContentType.parse("application/json"));
    } else {
      print('<op>------application/x-www-form-urlencoded');
      op = new Options(
          contentType: ContentType.parse("application/json"));
    }

    op.method = method;


    print('<op.method>------${op.method.toString()}');
    print('<op.data>------${data.toString()}');

    /// 统一带上token
    return _dio.request<Map<String, dynamic>>(
        method == "get" ? uri : "$uri?token=$enToken",
        data: data,
        options: op);
  }

  /// 对请求返回的数据进行统一的处理
  /// 如果成功则将我们需要的数据返回出去，否则进异常处理方法，返回异常信息
  static Future<T> logicalErrorTransform<T>(
      Response<Map<String, dynamic>> resp) {

    print('我的请求返回了一些什么 ${resp.data}');
    if (resp.data != null) {
      if (resp.data["code"] == 0) {
        T realData = resp.data["data"];
        return Future.value(realData);
      }
    }

    if (debug) {
      print('resp--------$resp');
      print('resp.data--------${resp.data}');
    }
    LogicError error;
    if (resp.data != null && resp.data["code"] != 0) {
      if (resp.data['data'] != null) {
        /// 失败时  错误提示在 data中时
        /// 收到token过期时  直接进入登录页面
        Map<String, dynamic> realData = resp.data["data"];
        error = new LogicError(resp.data["code"], realData['codeMessage']);
      } else {
        /// 失败时  错误提示在 message中时
        error = new LogicError(resp.data["code"], resp.data["message"]);
      }

      /// token失效 重新登录  后端定义的code码
      if (resp.data["code"] == 10000000) {
//        NavigatorUtils.goPwdLogin(context);

      }
      if (resp.data["code"] == 80000000) {
        //操作逻辑
      }
    } else {
      error = unknowError;
    }
    return Future.error(error);
  }

  ///  获取token
  ///获取授权token
  static getToken() async {
//    String token = await LocalStorage.get(LocalStorage.TOKEN_KEY);
    return token;
  }
}

class LogicError {
  int errorCode;
  String msg;

  LogicError(errorCode, msg) {
    this.errorCode = errorCode;
    this.msg = msg;
  }
}

enum PostType { json, form, file }

class Http2 {
  static Future<String> get(String url) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000; //连接超时
    dio.options.receiveTimeout = 100000; //接收超时
    String tokenId = HttpConfig.token;
    Response response;
    if (tokenId == null) {
      // response = await dio.get(Config.url + url );

      // 自己调用外部接口时
      response = await dio.get(url);
    } else {
      dio.options.headers = {"Authorization": tokenId};
      response = await dio.get(HttpConfig.url + url);
    }
//    print('get请求报文：${Config.url + url}${json.encode(response)}');
    // 自己调用外部接口时
    print('get请求报文：${HttpConfig.url + url}${response.data}');
//    String res = json.encode(response.data).toString();
    String res = response.data.toString();
    jumpLogin(res);
    return res;
  }

  static Future<String> post(String url, Object obj) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000; //连接超时
    dio.options.receiveTimeout = 100000; //接收超时
    String tokenId = HttpConfig.token;
    Response response;
    if (tokenId == null) {
      response = await dio.post(HttpConfig.url + url, data: obj);
    } else {
      dio.options.headers = {"Authorization": tokenId};
      response = await dio.post(HttpConfig.url + url, data: obj);
    }

    print('post请求报文：${HttpConfig.url + url}${json.encode(response.data)}');
    String res = json.encode(response.data).toString();
    jumpLogin(res);
    return res;
  }

  // 文件上传pa
  static Future<String> upolad(String url, File file) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000; //连接超时
    dio.options.receiveTimeout = 100000; //接收超时
    String tokenId = HttpConfig.token;
    print(tokenId);
    Response response;
    print(file);
    FormData formData = new FormData.from({
      "file": new UploadFileInfo(file, "upload.png"),
    });
    print(formData['file']);
    if (tokenId == null) {
      response = await dio.post(HttpConfig.url + url, data: formData);
    } else {
      dio.options.headers = {"Authorization": tokenId};
      response = await dio.post(HttpConfig.url + url, data: formData);
    }

    print('upload请求报文：${HttpConfig.url + url}${json.encode(response.data)}');
    String res = json.encode(response.data).toString();
    jumpLogin(res);
    return res;
  }

  //如果token失效跳转登录页
  static void jumpLogin(response) {
    Map<String, dynamic> map = jsonDecode(response);
    if (map['code'] == 101) {
//      Router.push2(Router.globalContext, LoginPage());
    }
  }

  //需要请求外网地址 -- json
  static Future<String> abroadGet(String url) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000; //连接超时
    dio.options.receiveTimeout = 100000; //接收超时
    Response response;
    response = await dio.get(url);
//    String res = await dio.get(url).toString();

    print('abroadGet请求报文:${response.data.toString()}');
    return response.data;
  }

  //需要请求外网地址 -- String
  static Future<String> plainGet(String url) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000; //连接超时
    dio.options.receiveTimeout = 100000; //接收超时
//  PLAIN
    dio.options.responseType = ResponseType.plain; //接收data String

    Response response;
    response = await dio.get(url);
    print('plainGet请求报文:${response.data.toString()}');
    return response.data.toString();
  }
}
