/***
 * 项目工具函数
 * 1. getImgPath  完整图片路径
 * 2. launchTelURL  启动拨号
 * 3. Base64加密
 * 4. Base64解密
 * 5. MD5加密
 */

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static void launchTelURL(String phone) async {
    String url = 'tel:' + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Toast.show('拨号失败！', position: 'center');
    }
  }

  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  // md5 加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return digest.toString();
  }
}
