import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:flutter_taozugong_app/pages/home/index.dart';
import 'package:flutter_taozugong_app/pages/category/index.dart';
import 'package:flutter_taozugong_app/pages/mine/index.dart';

class IndexPage extends StatefulWidget {
  final String title;
  IndexPage({Key key, this.title}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text('分类')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
  ];

  final List<Widget> tabContainers = [HomePage(), CategoryPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return ScopedModelDescendant<GlobalModel>(
      builder: (context, child, model) {
        int currentIndex = model.currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          appBar: AppBar(
            // leading: Builder(builder: (context) {
            //   return IconButton(
            //     icon: Icon(Icons.menu, color: Colors.white), //自定义图标
            //     onPressed: () {
            //       // 打开抽屉菜单  
            //       Scaffold.of(context).openDrawer(); 
            //     },
            //   );
            // }),
            title: Text(widget.title ?? '淘租公'),
            centerTitle: true,
            actions: <Widget>[
              Center(
                child: Text('早上好'),
              ),
              IconButton(
                icon: Icon(Icons.share),
                tooltip: '分享',
                onPressed: () => debugPrint('You Pressed the Appbar actions!'),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (index) {
              model.changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabContainers,
          ),
        );
      },
    );
  }
}
