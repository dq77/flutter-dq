import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/model/global.dart';
import 'package:flutter_taozugong_app/model/goods/index.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/pages/mine/myCard/index.dart';

import 'package:fluro/fluro.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

class OrderEntryList extends StatefulWidget {
  OrderEntryList({Key key}) : super(key: key);

  _OrderEntryListState createState() => new _OrderEntryListState();
}

class _OrderEntryListState extends State<OrderEntryList> {
  Model getModel(BuildContext context) {
    print('获取订单列表');
    final globalModel = GlobalModel().of(context);
    globalModel.getoreDerunpaid();

    return globalModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(
      builder: (context, child, model) {
        // print('model${model.orderStatusNumlist}');
        var num_0 = model.orderStatusNumlist[0].num.toString();
        var num_1 = model.orderStatusNumlist[1].num.toString();
        var num_2 = model.orderStatusNumlist[2].num.toString();
        var num_3 = model.orderStatusNumlist[3].num.toString();
        return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: <Widget>[
                  MyCard(
                    child: Container(
                      height: ScreenUtil().setHeight(172.0),
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _buildTabView(0, "be-pay", "待支付", num_0),
                          _buildTabView(1, "be-shipped", "待发货", num_1),
                          _buildTabView(2, "be-received", "待收货", num_2),
                          _buildTabView(3, "be-rent", "租赁中", num_3),
                          _buildTabView(4, "be-rent", "全部订单", '0')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget _buildTabView(
      int index, String imgUrl, String text, String emblemNum) {
    return InkWell(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Utils.getImgPath(imgUrl),
                  width: ScreenUtil().setWidth(70.0),
                  height: ScreenUtil().setHeight(70.0),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(text, style: TextStyle(fontWeight: FontWeight.normal))
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 1.0,
            child: index < 4 && emblemNum != '0'
                ? DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4759),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2.0),
                      child: Text(
                        emblemNum,
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ),
                  )
                : new SizedBox(),
          )
        ],
      ),
      onTap: () {
        Application.router.navigateTo(context, "/orderList",
            transition: TransitionType.inFromBottom);
      },
    );
  }
}
