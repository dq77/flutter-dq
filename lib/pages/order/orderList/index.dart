import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/pages/order/orderList/listView.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '全部', icon: Icons.directions_car),
  const Choice(title: '待支付', icon: Icons.directions_bike),
  const Choice(title: '代发货', icon: Icons.directions_boat),
  const Choice(title: '待收货', icon: Icons.directions_bus),
  const Choice(title: '租赁中', icon: Icons.directions_railway),
];

class OrderListPage extends StatefulWidget {
  OrderListPage({Key key}) : super(key: key);

  _OrderListPageState createState() => _OrderListPageState();
}

@override
void initState() {
  // super.initState();
}

class _OrderListPageState extends State<OrderListPage> {
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
          title: const Text('订单列表', style: TextStyle(color: Colors.black)),
          bottom: new TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(text: choice.title);
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: choices.map((Choice choice) {
            return new Padding(
                padding: const EdgeInsets.all(0.0),
                child: new InkWell(
                  onTap: () {
                    Application.router.navigateTo(context, "/orderDetail",
                        transition: TransitionType.inFromBottom);
                  },
                  child: OrderListView(),
                ));
          }).toList(),
        ),
      ),
    ));
  }
}

// Application.router.navigateTo(context, "/orderDetail",
//                           transition: TransitionType.inFromBottom);
