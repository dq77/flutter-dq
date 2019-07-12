import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

class CateBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List catesList;
  const CateBar({Key key, this.tabController, this.catesList})
      : super(key: key);

  @override
  _CateBarState createState() => _CateBarState();

  get preferredSize {
    return Size.fromHeight(30);
  }
}

class _CateBarState extends State<CateBar> {
  @override
  Widget build(BuildContext context) {
    print('CateList ${widget.catesList.toString()}');
    print('CateList Width ${MediaQuery.of(context).size.width}');
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
              controller: widget.tabController,
              labelStyle: TextStyle(fontSize: 16.0),
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: buildTabs(model.categoryData)));
    });
  }

  List<Widget> buildTabs(catesList) {
    List<Widget> tabs = [];
    for (var cate in catesList) {
      tabs.add(InkWell(
        onTap: (){
          print('当前的分类ID ${cate.id}');
        },
        child:Tab(text: cate.name)
      ));
      print('${cate.name}');
    }

    print('${tabs.toList().toString()}');
    return tabs.toList();
  }
}

// class CateBar extends StatelessWidget implements PreferredSizeWidget {
//   get preferredSize {
//     return Size.fromHeight(30);
//   }

//   final List catesList;
//   const CateBar({Key key, this.catesList})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       color: Colors.white,
//       width: MediaQuery.of(context).size.width,
//       child: TabBar(
//           labelStyle: TextStyle(fontSize: 16.0),
//           labelColor: Colors.black,
//           isScrollable: true,
//           unselectedLabelColor: Colors.black,
//           indicatorSize: TabBarIndicatorSize.tab,
//           tabs: catesList
//               .map((cate) => Container(
//                     height: 48.0,
//                     child: new Tab(text: cate['name']),
//                   ))
//               .toList()),
//     );
//   }
// }
