import 'package:flutter/material.dart';

import 'package:flutter_taozugong_app/components/swiperBanner/index.dart';

  List<Map> bannerLists = [
    {'img':'https://img.taozugong.com/banner-picture/2019-05-20/20190520210730150633436.png'},
    {'img':'https://img.taozugong.com/test/2019-01-04/20190104185908992458628.jpg'},
    {'img':'https://img.taozugong.com/banner-picture/2019-05-20/20190520210730150633436.png'}
  ];

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SwiperBanner(swiperDataList:bannerLists,height: 333.0),
          ),
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: <Widget>[
                  Text('推荐'),
                  SizedBox(width: 5.0,),
                  Text('洗护'),
                  SizedBox(width: 5.0,),
                  Text('家电数码'),
                  SizedBox(width: 5.0,),
                  Text('家具'),
                  SizedBox(width: 5.0,),
                  Text('游戏'),
                  SizedBox(width: 5.0,),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}