import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';

import 'package:flutter_taozugong_app/pages/index.dart';

import 'package:flutter_taozugong_app/routers/routers.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:oktoast/oktoast.dart';
import 'package:flustars/flustars.dart' as FlutterStars;

void main() async {
  await FlutterStars.SpUtil.getInstance();
  // 创建顶层状态
  GlobalModel globalModel = new GlobalModel();

  runApp(ScopedModel<GlobalModel>(model: globalModel, child: MyApp()));

  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return OKToast(
        child: new MaterialApp(
      title: '淘租公-租出新生活',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: IndexPage(title: '淘租公'),
    ));
  }
}
