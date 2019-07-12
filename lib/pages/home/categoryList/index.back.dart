import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/pages/home/categoryList/cateBar.dart';
import 'package:flutter_taozugong_app/pages/home/categoryList/cateGoodslist.dart';

class CategoryTabWidget extends StatefulWidget {
  final List catesList;
  final List goodsList;
  CategoryTabWidget({Key key, this.catesList, this.goodsList})
      : super(key: key);

  _CategoryTabWidgetState createState() => _CategoryTabWidgetState();
}

class _CategoryTabWidgetState extends State<CategoryTabWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: widget.catesList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CateBar(tabController: _tabController, catesList: widget.catesList),
        SizedBox(height: 10.0),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: widget.catesList.map((cateItem) {
            return new Container(
              child: CateGoodslist(cateItem: cateItem),
            );
          }).toList(),
        ))
      ],
    ));
  }
}

class CateItem {
  const CateItem({this.id, this.name});
  final String id;
  final String name;
}

// class CategoryListWidget extends StatelessWidget {
//   final List catesList;
//   final List goodsList;

//   const CategoryListWidget({Key key, this.catesList, this.goodsList})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return new DefaultTabController(
//         length: catesList.length,
//         initialIndex: 0,
//         child: Column(
//           children: <Widget>[
//             CateBar(catesList: catesList),
//             SizedBox(height: 10.0),
//             Expanded(
//                 child: TabBarView(
//               children: catesList.map((cateItem) {
//                 return new Container(
//                   child: CateGoodslist(cateItem: cateItem),
//                 );
//               }).toList(),
//             ))
//           ],
//         ));
//   }
// }

// class CateItem {
//   const CateItem({this.id, this.name});
//   final String id;
//   final String name;
// }
