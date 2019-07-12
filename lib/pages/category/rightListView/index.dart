import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_taozugong_app/model/categoryPage/index.dart';

import 'package:flutter_taozugong_app/components/goodItem/index.dart';

import 'package:flutter_taozugong_app/model/category/index.dart';
import 'goodsItem.dart';

class RightListView extends StatefulWidget {
  final double viewHeight;
  RightListView({Key key, this.viewHeight}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RightListViewState();
}

class RightListViewState extends State<RightListView> {
  int currentPage = 0;
  bool isAnimating = false;
  int itemCount = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Container(
          height: widget.viewHeight,
          padding: EdgeInsets.only(top: 10.0),
          width: ScreenUtil().setWidth(588),
          child: model.goodsList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : model.goodsList != null && model.goodsList.isNotEmpty
                  ? ListView.builder(
                      itemCount: model.goodsList.length,
                      itemBuilder: (contex, index) {
                        return itemBuilder(
                            context, model.goodsList[index], 140.0, 140.0);
                      },
                    )
                  : Center(
                    child: Text('该分类暂无数据'),
                  ));
    });
  }
}
