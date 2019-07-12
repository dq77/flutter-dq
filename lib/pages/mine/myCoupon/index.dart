import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class MyCouponPage extends StatefulWidget {
  MyCouponPage({Key key}) : super(key: key);

  _MyCouponPageState createState() => _MyCouponPageState();
}

class _MyCouponPageState extends State<MyCouponPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('返回上一页');
              Navigator.pop(context);
            },
          ),
          title: const Text('我的优惠券', style: TextStyle(color: Colors.black)),
          bottom: new TabBar(
            indicatorColor: Colors.blue,
            labelPadding: EdgeInsets.only(left: 50, right: 50),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(text: choice.title);
            }).toList(),
          ),
        ),
        body: new Container(
          color: GlobalColor.whiteWordColor,
          child: TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(0.0),
                child: new ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    ));
  }
}

// Application.router.navigateTo(context, "/orderDetail",
//                           transition: TransitionType.inFromBottom);
class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '未使用'),
  const Choice(title: '已使用'),
  const Choice(title: '已过期'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: GlobalFont.fontSize14,
        color: GlobalColor.categoryDefaultColor);
    return new Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(200)),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Image(
                image: AssetImage('assets/images/coupon/noCoupon.jpg')),
          ),
          new Container(
            height: 10,
          ),
          new Text('还有没券哦', style: textStyle),
        ],
      ),
    );
  }
}
