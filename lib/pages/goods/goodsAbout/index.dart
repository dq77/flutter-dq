import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/pages/goods/specFloatLayout/free_bottom_sheet.widget.dart';
import 'package:flutter_taozugong_app/pages/goods/specFloatLayout/index.dart';
import 'package:flutter_taozugong_app/pages/goods/goodsCoupon/index.dart';
import 'package:flutter_taozugong_app/pages/goods/Explain/index.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class ListItemPage extends StatefulWidget {
  final text;
  final type;

  ListItemPage({Key key, this.text, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CommodityDetailState();
}

class CommodityDetailState extends State<ListItemPage> {
  BuildContext _context;
  String content = '';

  Widget listItem(title, content) {
    return new Container(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                title,
                style: TextStyle(
                    color: GlobalColor.color999,
                    fontSize: GlobalFont.fontSize12,
                    height: 1.2),
              )),
              flex: 1,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: new Text(
                    content,
                    style:
                        TextStyle(fontSize: GlobalFont.fontSize12, height: 1.2),
                  )),
              flex: 10,
            ),
            new Expanded(
                flex: 0,
                child: new Container(
                    child: new Icon(
                  Icons.chevron_right,
                  color: GlobalColor.rightIconColor,
                  size: 20,
                ))),
          ],
        ));
  }

  Widget listItemNoIcon(title, content) {
    return new Container(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                title,
                style: TextStyle(
                    color: GlobalColor.color999,
                    fontSize: GlobalFont.fontSize12,
                    height: 1.2),
              )),
              flex: 1,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: new Text(
                    content,
                    style:
                        TextStyle(fontSize: GlobalFont.fontSize12, height: 1.2),
                  )),
              flex: 10,
            ),
          ],
        ));
  }

  Widget divider() {
    return new Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        height: 1,
        color: GlobalColor.divideColor);
  }

  showSpecificationsBottom() {
    print('弹出规格选择器');
    showFreeModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return new Container(height: 570, child: SpecificationsPage());
        });
  }

  showGoodsCouponsBottom(){
    showFreeModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return new Container(height: 570, child: GoodsCoupon());
        });
  }

  showExplainBotton(){
    showFreeModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return new Container(height: 370, child: Explain());
        });
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    // TODO: implement build
    return new Column(
      children: <Widget>[
        divider(),
        new InkWell(
          child: listItem('规格', '请选择商品规格'),
          onTap: showSpecificationsBottom,
        ),

        new InkWell(
          child: listItem('优惠', '优惠券可领'),
          onTap: showGoodsCouponsBottom,
        ),
        divider(),
        InkWell(
          child:listItem('运费', '部分地区包邮'),
          onTap: showExplainBotton,
        ),

        divider(),
        listItemNoIcon('说明', '正品保证  |   信用免押  |  分期免手续费   '),
        divider(),
      ],
    );
  }
}
