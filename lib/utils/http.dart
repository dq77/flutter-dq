import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/common/local/local_storage.dart';
import 'package:flustars/flustars.dart' as FlutterStars;

class Api {
  static const String BASE_URL = "https://www.wanandroid.com/";

  static const String TEST_URL = "https://api.hencoder.com/author";

  //首页banner
  static const String BANNER = "banner/json";

  //首页文章列表
  static const String ARTICLE_LIST = "article/list/1/json";

  //体系数据
  static const String TREE = "tree/json";

  //导航数据
  static const String NAVI = "navi/json";

  //项目分类
  static const String PROJECT = "project/tree/json";

  //项目列表数据
  static const String PROJECT_LIST = "project/list/1/json";

  //登录
  static const String LOGIN = "user/login";
}

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = new HttpUtil();
    return instance;
  }

  /*
   * config it and create
   */
  HttpUtil() {
    String token = FlutterStars.SpUtil.getString('token') ?? '';
    print('TokenTokenToken $token');
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = new BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: HttpConfig.url,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        //do something
        "version": "1.0.0",
        "Authorization": token
        // "Authorization":
        //     LocalStorage.get('token') ? LocalStorage.get('token') : ''
      },
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
      contentType: ContentType.json,
      //表示期望以那种格式(方式)接受响应数据。接受三种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );

    dio = new Dio(options);

    //Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前 ${options.headers.toString()}");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前 ${e.toString()}");
      // Do something with response error
      return e; //continue
    }));
  }

  /*
   * get请求
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    print('get success---------$url');
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------$url');
      print('get success---------${options.toString()}');
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');

      // response.data; 响应体
      // response.headers; 响应头
      // response.request; 请求体
      // response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          data: data, options: options, cancelToken: cancelToken);
          
      print('get success---------$url');
      print('get success---------${options.toString()}');
      print('get success---------${data.toString()}');
      print('get success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response.data;
  }


  delete(url,{data, options, cancelToken}) async{
    Response response;
    try {
      response = await dio.delete(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
          
      print('delete success---------$url');
      print('delete success---------${options.toString()}');
      print('delete success---------${data.toString()}');
      print('delete success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response.data;

  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }//
  // 文件上传pa
   uploadFile(String url, File file) async {

    Response response;
    print(file);
    FormData formData = new FormData.from({
      "file": new UploadFileInfo(file, "upload.png"),
    });
    print(formData['file']);
      response = await dio.post( url, data: formData);

    print('upload请求报文：${url}${json.encode(response.data)}');
    return response.data;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
