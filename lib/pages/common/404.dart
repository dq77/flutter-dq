import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/components/appBar/index.dart';
import 'package:flutter_taozugong_app/pages/common/stateLayout.dart';

// 404页面
class WidgetNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "页面不存在",
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: "页面不存在",
      ),
    );
  }
  
}
