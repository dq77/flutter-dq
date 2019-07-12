import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/common/resources.dart';
import 'package:flutter_taozugong_app/model/goods/entity.coupons.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

class GoodsCoupon extends StatefulWidget {
  final List couponsData;
  GoodsCoupon({Key key, this.couponsData}) : super(key: key);

  _GoodsCouponState createState() => _GoodsCouponState();
}

class _GoodsCouponState extends State<GoodsCoupon> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Container(
        child: Column(
          children: <Widget>[
            popUpTitle('可领取优惠券'),
            divider(),
            Container(
                height: 480.0,
                padding: EdgeInsets.all(12.0),
                child: buildCouponItems(model,model.goodsAboutCouponsData))
          ],
        ),
      );
    });
  }

  Widget buildCouponItems(model,couponsData) {
    print('优惠券数据22222 ${couponsData.toString()}');
    List<Widget> couponsItems =
        []; //先建一个数组用于存放循环生成的widget //单独一个widget组件，用于返回需要生成的内容widget
    for (var item in couponsData) {
      couponsItems.add(couponItem(model,item));
    }
    return ListView(children: couponsItems);
  }

  Widget couponItem(model,couponsItem) {
    String textDate = couponsItem.validStartTime != null
        ? '有效期${couponsItem.validStartTime}  至 ${couponsItem.validEndTime}'
        : '${couponsItem.couponDay} 天后过期';
    return new Container(
        height: 120.0,
        color: Color(0xffccecff),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '￥ ${couponsItem.couponMoney}',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colours.app_main,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Gaps.vGap5,
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${couponsItem.couponName}',
                            style: TextStyle(
                              color: Colours.app_main,
                            ),
                          ),
                        ),
                        Gaps.vGap5,
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(textDate,
                              style: TextStyle(
                                color: Colours.app_main,
                              )),
                        ),
                      ])),
              FlatButton(
                child: Text('${couponsItem.useStatus == 40 ? '立即领取':'已领取'} '),
                color: couponsItem.useStatus == 40 ? Colours.app_main:Colors.grey,
                textColor: Colors.white,
                onPressed: couponsItem.useStatus == 40 ? () {
                  print('点击了领取 ${couponsItem.toString()}');
                  model.getCoupon(couponsItem.id.toString());
                }: null,
              )
            ]));
  }

  Widget popUpTitle(String title) {
    return Stack(children: <Widget>[
      Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))),
      Positioned(
        right: 8.0,
        top: 15.0,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
      )
    ]);
  }

  Widget divider() {
    return new Container(
        margin: EdgeInsets.all(0.0), height: 1, color: Color(0xffebebeb));
  }
}
