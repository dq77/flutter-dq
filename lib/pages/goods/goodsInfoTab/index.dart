//  产品详情里面的tab页
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductParam extends StatefulWidget {
  final snapshot;
  ProductParam({Key key, this.snapshot}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<ProductParam> {
  final List<String> productParam = ['租赁概述', '规格详情', '售后说明'];

  @override
  Widget build(BuildContext context) {
    print('SNAPSHOT  ${widget.snapshot.detail}');

    return new DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: <Widget>[
            tabber(),
            new Container(
              height: 16,
            ),
            Expanded(
                child: TabBarView(
              children: <Widget>[
                tabContent(widget.snapshot.detail),
                tabContent(widget.snapshot.parameterList),
                tabContent(widget.snapshot.afterSaleList)
              ],
            ))
          ],
        ));
  }

  Widget tabber() {
    return Container(
      //color: Colors.white,
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      width: ScreenUtil().setWidth(750.0),
      child: TabBar(
          labelStyle: TextStyle(fontSize: 16.0),
          labelColor: Colors.black,
          isScrollable: false,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: productParam
              .map((i) => Container(
                    height: 48.0,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: new Tab(text: i),
                  ))
              .toList()),
    );
  }
}

Widget tabContent(List itemList) {
  List<Widget> images = []; //先建一个数组用于存放循环生成的widget
  Widget content; //单独一个widget组件，用于返回需要生成的内容widget
  for (var item in itemList) {
    images.add(
      Image.network(item, fit: BoxFit.cover),
    );
  }
  return Container(child: ListView(children: images));
}
