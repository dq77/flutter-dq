import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/model/categoryPage/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:flutter_taozugong_app/pages/category/leftMenu/index.dart';
import 'package:flutter_taozugong_app/pages/category/rightListView/index.dart';

import 'package:flutter_taozugong_app/model/mockData/index.dart';

class CategoryPage extends StatefulWidget {
  
  final double rightListViewHeight;
  CategoryPage({Key key, this.rightListViewHeight}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int currentPage = 0;
  GlobalKey<RightListViewState> rightListviewKey =
      new GlobalKey<RightListViewState>();
  GlobalKey<CategoryMenueState> categoryMenueKey =
      new GlobalKey<CategoryMenueState>();

  List<SubCategoryListModel> listViewData = [];
  bool isAnimating = false;
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    print('TTTTTopPadding   $topPadding');
    var warpHeight = MediaQuery.of(context).size.height;

    if (topPadding != 24.0) {
      warpHeight = MediaQuery.of(context).size.height;
    }

    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return new Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: GlobalColor.whiteWordColor,
          //   title: new Text(
          //     '分类',
          //     style: TextStyle(
          //         color: GlobalColor.blackWordColor,
          //         fontSize: GlobalFont.fontSize18),
          //   ),
          //   centerTitle: true,
          // ),
          body: Container(
              color: Colors.white, //Color(0xFFFFFFFF)
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(top: 0.0),
                            height: warpHeight,
                            color: Color(0xFFf7f7f7),
                            width: ScreenUtil().setWidth(162),
                            child: CategoryMenue(
                                itemHeight: ScreenUtil().setHeight(96),
                                itemWidth: ScreenUtil().setWidth(162),
                                ),
                          ),
                        ),
                        RightListView(viewHeight: warpHeight)
                      ],
                    ),
                  )
                ],
              )));
    });
  }

  Widget initHead() {
    return new Scaffold(
      backgroundColor: GlobalColor.whiteWordColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: GlobalColor.primaryColor,
        title: new Text('分类'),
        centerTitle: true,
      ),
    );
  }

  menueItemTap(model) {
    print('点击左侧分类按钮 ${model.defaultCategoryId}');
    //rightListviewKey.currentState.jumpTopage(i);
  }

  listViewChanged(i) {
    print('listViewChanged ${i}');
    // this.categoryMenueKey.currentState.moveToTap(i);
  }

  @override
  void reassemble() {
    print('什么时候触发');
    listViewData = Tabber.categoryData.map((i) {
      return SubCategoryListModel.fromJson(i);
    }).toList();

    super.reassemble();
  }

  @override
  void initState() {
    super.initState();
    listViewData = Tabber.categoryData.map((i) {
      return SubCategoryListModel.fromJson(i);
    }).toList();

    final globalModel = GlobalModel().of(context);
    globalModel.getCategoryList();
  }
}
