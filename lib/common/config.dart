import 'package:flutter/material.dart';


class HttpConfig {

  /// flutter 四种运行模式 Debug\Release\Profile\test\
  /// 根据gradle配置自动生成的BuildConfig类来判断当前的运行模式
  /// 当App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false。
  /// Release：const bool.fromEnvironment("dart.vm.product") = true；
  /// Debug：assert(() { ...; return true; });断言语句会被执行；
  /// Profile：上面的两种情况均不会发生。
  static const bool inProduction = const bool.fromEnvironment("dart.vm.product");

  // 测试地址
  static const test_baseUrl = 'http://47.98.113.37:8080';
  static const test_imgUploadUrl = 'http://47.98.113.37:8080';

  // static const test_baseUrl = 'https://api.taozugong.cn';
  // static const test_imgUploadUrl = 'http://api.taozugong.cn';

  // 正式服务地址
  static const baseUrl = 'https://service.taozugong.com';
  static const imgUploadUrl = 'https://service.taozugong.com';
  static const imagAddress = 'https://tzg-test-img.oss-cn-hangzhou.aliyuncs.com/';
  static var url = inProduction ? baseUrl : test_baseUrl;


  ///  图片前缀地址
  static String imgbaseUrl = '';
  static String token = '';

  static String channel = 'APP';

}


class GlobalConfig {

  static ThemeData themeData = ThemeData(
      primaryColor: GlobalColor.primaryColor
  );

  static Color fontColor = GlobalColor.txtColor333;
  static bool dark = true;
  static Color searchBackgroundColor = Colors.white10;
  static Color cardBackgroundColor = Color(0xFF222222);
  static Color primaryColor = Color(0XFFb3c9d7);
  static TextStyle defaultStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
  static TextStyle searchResultItemCommentCountStyle = TextStyle(
      fontSize: 12, color: Color(0xFF999999));

}

class GlobalColor {
  ///   不透明度
  /// 00%=FF（不透明） 5%=F2 10%=E5 15%=D8 20%=CC 25%=BF 30%=B2 35%=A5 40%=99
  /// 45%=8c 50%=7F 55%=72 60%=66 65%=59 70%=4c 75%=3F 80%=33 85%=21 90%=19 95%=0c 100%=00（全透明）
  /// 0xFF00A4FF  0x 表示16进制  //0x 后面开始 两位FF表示透明度16进制，之后的00A4FF代表RGB色值
  ///

  static Color primaryColor = Color(0xFF00A4FF);
  static Color disabledColor = Color(0xFFDDDDDD);
  static Color whiteTextColor = Color(0xFFFFFFFF);
  static Color txtColor333 = Color(0xFF333333);
  static Color txtColor999 = Color(0xFF999999);
  static Color txtColorCCC = Color(0xFFCCCCCC);


  static Color blueColor = Color(0xFF4FB3DE);
  static Color buttonColor = Color(0xFF45a3f8);
  static Color bottomBarbgColor = Color.fromRGBO(250, 250, 250, 1.0);
  static Color greenColor= Colors.green;

  static Color prominentColor = Color(0XFFb3c9d7);
  static Color whiteWordColor = Color(0XFFffffff);
  static Color blackWordColor = Color(0XFF333333);
  static Color searchBarColor = Color(0XFFf7f7f7);
  static Color divideColor = Color(0XFFf6f6f6);
  static Color rightIconColor = Color(0XFFcccccc);
  static Color baseColor = Color(0XFF00A4FF);
  static Color redColor = Color(0XFFFF1926);
  static Color greyColor = Color(0xFFEEEEEE);
  static Color categoryDefaultColor = Color(0xFF666666);
  static Color color999 = Color(0xFF999999);
  static Color backPageColor = Color(0xFFF3F4F5);
  static Color moneyColor = Color(0xFFFF1926);
  static Color borderColor = Color(0xFFE9E9E9);

}

class GlobalFont {
  /// 用户标题文字、强调作用
  static double fontSize10 = 10.0;
  static double fontSize12 = 12.0;
  static double fontSize11 = 11.0;
  static double fontSize13 = 13.0;
  static double fontSize14 = 14.0;
  static double fontSize16 = 16.0;
  static double fontSize18 = 18.0;
  static double fontSize20 = 20.0;
  static double fontSize24 = 24.0;
  static double titleFontSize = 27.0;
}

class Zlength{
  static const double topBarHeight = 45;
  static const double bottomBarHeight = 54;
  static const int designWidth = 360; //设计稿宽度
  static const double searchTxtFieldHeight=34;
}

