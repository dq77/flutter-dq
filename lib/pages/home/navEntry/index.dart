import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/common/config.dart';

/// 无状态组件

class NavsEntryWidget extends StatelessWidget {
  final List navsList;
  NavsEntryWidget({Key key, this.navsList}) : super(key: key);

  Widget _gridItemBuilder(BuildContext context, item, int index) {

    // print('导航接收到了数据 ${navsList.toString()}');
    return new InkWell(
      onTap: () {
        print('你点击了导航入口');
        _goNavContent(context, index, item['title']);
      },
      child: Column(
        children: <Widget>[
          Image.network(item['img'],
              fit: BoxFit.fill, width: ScreenUtil().setWidth(110)),
          Text(item['name'] ?? '',
              style: TextStyle(color: Colors.black, fontSize: 12.0))
        ],
      ),
    );
  }

  void _goNavContent(context, int index, String title) {
    print('你当前点击的内容是 $title');
  }

  @override
  Widget build(BuildContext context) {
    print('刷新了页面 ${navsList.length}');
    double contentHeight = 160;
    if (navsList.length > 4 && navsList.length <= 8) {
      contentHeight = 320;
    } else if(navsList.length > 8) {
      contentHeight = 320;
      navsList.removeRange(8, navsList.length);
    }

    var tempIndex = -1;

    return Container(
      color: Colors.white,
      //margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(contentHeight),
      padding: EdgeInsets.only(top: 10.0),
      child: navsList.length > 0 ? GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        padding: EdgeInsets.all(4.0),
        children: navsList.map((item) {
          tempIndex++;
          return _gridItemBuilder(context, item, tempIndex);
        }).toList(),
      ):null,
    );
  }
}


/// 有状态组件
class NavsEntry extends StatefulWidget {
  @override
  _NavsEntryState createState() => new _NavsEntryState();
}

class _NavsEntryState extends State<NavsEntry> {

  @override
  Widget IconNav(String imgUrl, String text) {
    return new Container(
      padding: EdgeInsets.all(0.0),
      height: 120.0,
      child: Column(
        children: <Widget>[
          Center(
            child: new Container(
              width: 76.0,
              height: 76.0,
              child: Image.network(imgUrl, fit: BoxFit.fill),
            ),
          ),
          Center(
            child: new Container(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new Expanded(
          child: IconNav(
              'https://img.taozugong.com/navigation-picture/2019-05-14/20190514234438256286159.png',
              '网红爆款'),
          flex: 3,
        ),
        new Expanded(
          child: IconNav(
              'https://img.taozugong.com/navigation-picture/2019-05-14/20190514234503186797252.png',
              '好货租赁'),
          flex: 3,
        ),
        new Expanded(
          child: IconNav(
              'https://img.taozugong.com/navigation-picture/2019-05-14/20190514234518622533675.png',
              '超值售卖'),
          flex: 3,
        ),
        new Expanded(
          child: IconNav(
              'https://img.taozugong.com/navigation-picture/2019-05-14/20190514234529890293869.png',
              '一元试用'),
          flex: 3,
        )
      ],
    );
  }
}
