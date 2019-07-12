import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_taozugong_app/pages/home/selection/index.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

import 'package:flutter_taozugong_app/model/home/index.dart';
import 'package:flutter_taozugong_app/service/home/index.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:flutter_taozugong_app/components/swiperBanner/index.dart';
import 'package:flutter_taozugong_app/pages/home/navEntry/index.dart';

import 'package:flutter_taozugong_app/pages/home/categoryList/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  String goodno = '313688614955384832';

  Model getModel(BuildContext context) {
    // final globalModel = ScopedModel.of(GlobalModel)(context);
    print('获取model');
    final globalModel = GlobalModel().of(context);
    globalModel.increment();
    globalModel.getBannerList();
    globalModel.getNavsEntryList();
    globalModel.getSelection();
    globalModel.getUserInfo();
    globalModel.getGoodsCategoryList();
    return globalModel;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print('初始化状态');
    super.initState();
    getModel(context);
    // getHomeBanner();
  }

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _refreshHeaderKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _refreshFooterKey =
      new GlobalKey<RefreshFooterState>();

  getHomeBanner() {
    print('请求返回结果');
    HomeApiInterface.getBannerList('5', channel: 'APP').then((data) {
      print('请求返回结果 $data');
    }).catchError((errorMsg) {
      /// 请求失败  进入了自定义的error拦截
      print('请求失败 $errorMsg');
    });
  }

  Widget build(BuildContext context) {
    super.build(context);
    final double topPadding = MediaQuery.of(context).padding.top;
    print(topPadding);
    var warpHeight = MediaQuery.of(context).size.height - 90.0;
    if (topPadding != 24.0) {
      warpHeight = MediaQuery.of(context).size.height - 190.0;
    }

    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      // print('你看啊 你看啊 ${model.bannerList.toString()}');
      return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        body: EasyRefresh(
            key: _easyRefreshKey,
            refreshHeader: ClassicsHeader(
              key: _refreshHeaderKey,
              refreshText: '下拉刷新',
              refreshReadyText: '准备刷新',
              refreshingText: "数据刷新中...",
              refreshedText: '刷新完成',
              moreInfo: '更新以后',
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            refreshFooter: ClassicsFooter(
              key: _refreshFooterKey,
              bgColor: Colors.white,
              textColor: Colors.black,
              moreInfoColor: Colors.black,
              showMore: true,
              noMoreText: '没有更多了...',
              moreInfo: '加载中',
              loadText: '数据加载中',
              loadingText: '数据加载中',
              loadedText: '刷新完成',
              loadReadyText: '上拉加载',
            ),
            child: ListView(
              children: <Widget>[
                SwiperBanner(swiperDataList: model.bannerList, height: 333.0),
                SizedBox(height: 10.0),
                NavsEntryWidget(navsList: model.navsList),
                SizedBox(height: 10.0),
                SelectionWidget(selectionsList: model.selectionList),
                SizedBox(height: 10.0),
                new Container(
                    margin: EdgeInsets.all(0.0),
                    height: warpHeight,
                    child: CategoryListWidget())
                //  CounterText(count:model.count),
              ],
            ),
            onRefresh: () {
              print('下拉刷新');
              model.getBannerList();
            },
            loadMore: () async {
              print('加载更多。。。。。');
            }),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => model.increment(),
        //   child: Icon(Icons.add),
        // ),
      );
    });
  }
}

class CounterText extends StatelessWidget {
  final int count;
  CounterText({Key key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
          style: TextStyle(fontSize: 12.0),
        ),
        Text("${count}", style: TextStyle(fontSize: 48.0)),
      ],
    );
  }
}
