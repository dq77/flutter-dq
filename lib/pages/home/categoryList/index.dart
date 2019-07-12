import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/pages/home/categoryList/cateTabbarView.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';

class CategoryListWidget extends StatefulWidget {
  CategoryListWidget({Key key}) : super(key: key);

  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  TabController _tabController;

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Container(
          child: DefaultTabController(
              length: model.categoryData.length,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  _categoryBar(model),
                  SizedBox(height: 10.0),
                  Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: buildTabViews(model)))
                ],
              )));
    });
  }

  // 构建TabView
  List<Widget> buildTabViews(model) {
    List<Widget> tabViews = [];
    for (var cate in model.categoryData) {
      tabViews.add(CategoryTabBarView(categoryId:cate.id));
      print('${cate.name}');
    }

    print('${tabViews.toList().toString()}');
    return tabViews.toList();
  }

  // 分类View
  // Widget _categoryView(model) {
  //   return Container(
  //       //margin: EdgeInsets.only(top:70.0),
  //       child: model.goodsList.isEmpty
  //           ? Center(child: Text('当前类目下还没有数据哦'))
  //           : GridView.count(
  //               //横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
  //               crossAxisCount: 2,
  //               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //               //主轴间隔
  //               mainAxisSpacing: 4.0,
  //               childAspectRatio: 2 / 3.5,
  //               //横轴间隔
  //               crossAxisSpacing: 4.0,
  //               // shrinkWrap: true,
  //               // physics: new NeverScrollableScrollPhysics(),
  //               children: _buildGridTileList(model.goodsList),
  //             ));
  // }

  // List<Container> _buildGridTileList(List goodsList) {
  //   return new List.generate(
  //       goodsList.length,
  //       (int index) => new Container(
  //             child: _goodsItemWidget(goodsList[index]),
  //           ));
  // }

  // Widget _goodsItemWidget(goodsItem) {
  //   return InkWell(
  //     onTap: () {
  //       // Router.push(context, new _goodsItemWidgetDetail(no:1));
  //       Application.router.navigateTo(
  //           context, "/goodsDetail?no=${goodsItem.no}",
  //           transition: TransitionType.inFromLeft);
  //     },
  //     child: Card(
  //       color: Colors.white,
  //       elevation: 0.0,
  //       child: Column(
  //         children: <Widget>[
  //           new Container(
  //             color: Colors.white,
  //             padding: EdgeInsets.all(0.0),
  //             height: 164,
  //             child: Image.network(
  //               goodsItem.headFigure,
  //               fit: BoxFit.fill,
  //             ),
  //           ),
  //           new Container(
  //               child: Column(
  //             children: <Widget>[
  //               new Container(
  //                 padding: EdgeInsets.only(left: 8.0, top: 3.0),
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   goodsItem.name,
  //                   maxLines: 2,
  //                   style: TextStyle(
  //                       fontSize: 16.0,
  //                       height: 1.0,
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //               ),
  //               new Container(
  //                 padding: EdgeInsets.only(left: 8.0, top: 5.0),
  //                 alignment: Alignment.centerLeft,
  //                 child: new Container(
  //                     width: 50.0,
  //                     padding: EdgeInsets.only(
  //                         top: 2.0, left: 3.0, bottom: 2.0, right: 3.0),
  //                     child: new Text(
  //                       '12期免息',
  //                       style: TextStyle(
  //                           color: GlobalColor.baseColor, fontSize: 10.0),
  //                     ),
  //                     decoration: new BoxDecoration(
  //                         borderRadius: BorderRadius.all(
  //                           Radius.circular(2.0),
  //                         ),
  //                         border: new Border.all(
  //                             color: GlobalColor.baseColor, width: 1.0))),
  //               ),
  //               new Container(
  //                   padding: EdgeInsets.only(left: 8.0, top: 10.0),
  //                   alignment: Alignment.centerLeft,
  //                   child: new Row(
  //                     children: <Widget>[
  //                       new Text(
  //                         '￥${goodsItem.minPrice}',
  //                         style: TextStyle(color: Colors.red, fontSize: 16.0),
  //                       ),
  //                       new Text(
  //                         ' /${goodsItem.unit}',
  //                         style: TextStyle(color: Colors.grey, fontSize: 16.0),
  //                       )
  //                     ],
  //                   )),
  //             ],
  //           )),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //分类bar
  Widget _categoryBar(model) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontSize: 16.0),
            labelColor: Colors.black,
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: buildTabs(model.categoryData)));
  }
  
  // 构建TabBar
  List<Widget> buildTabs(catesList) {
    List<Widget> tabs = [];
    for (var cate in catesList) {
      // tabs.add(InkWell(
      //   onTap: (){
      //     print('当前的分类ID ${cate.id}');
      //   },
      //   child:Tab(text: cate.name)
      // ));

      tabs.add(Tab(text: cate.name));
      print('${cate.name}');
    }

    print('${tabs.toList().toString()}');
    return tabs.toList();
  }
}

class CateItem {
  const CateItem({this.id, this.name});
  final String id;
  final String name;
}
