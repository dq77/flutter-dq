import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  int page = 1;

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
    globalModel.getGoodsDetail('181113183159106840');
    return globalModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 7);
    getModel(context);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _refreshHeaderKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _refreshFooterKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double topPadding = MediaQuery.of(context).padding.top;
    print(topPadding);
    var warpHeight = MediaQuery.of(context).size.height - 90.0;
    if (topPadding != 24.0) {
      warpHeight = MediaQuery.of(context).size.height - 190.0;
    }

    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          body: NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                      backgroundColor: Colors.red,
                      pinned: true,
                      floating: true,
                      expandedHeight: 730,
                      flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background: Container(
                            //头部整个背景颜色
                            height: double.infinity,
                            color: Color(0xffffffff),
                            child: Column(
                              children: <Widget>[
                                SwiperBanner(
                                    swiperDataList: model.bannerList,
                                    height: 333.0),
                                SizedBox(height: 10.0),
                                NavsEntryWidget(navsList: model.navsList),
                                SizedBox(height: 10.0),
                                SelectionWidget(
                                    selectionsList: model.selectionList),
                                SizedBox(height: 10.0)
                              ],
                            ),
                          )),
                      bottom: TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontSize: 16.0),
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: true,
                          tabs: [
                            Tab(text: "推荐"),
                            Tab(text: "家具"),
                            Tab(text: "数码家电"),
                            Tab(text: "数码家电"),
                            Tab(text: "数码家电"),
                            Tab(text: "数码家电"),
                            Tab(text: "数码家电"),
                          ])),
                ];
              },
              body: TabBarView(controller: _tabController, children: [
                _buildListView("aaa:"),
                _buildListView("bbb:"),
                _buildListView("ccc:"),
                _buildListView("ccc:"),
                _buildListView("ccc:"),
                _buildListView("ccc:"),
                _buildListView("ccc:"),
              ])));
    });
  }

  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
      height: 144,
      child: Swiper(
          //第三方的banner库：flutter_swiper
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              height: 144,
              child: Image.network(
                "https://github.com/best-flutter/flutter_swiper/raw/master/banner.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: 3,
          scale: 0.9,
          pagination: new SwiperPagination()),
    );
  }

  //banner下面的按钮
  Widget _buildButtons() {
    return Expanded(
      child: Row(
        children: <Widget>[
          _buildButtonItem(Icons.chat, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.pages, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.phone_android, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.print, "xxxx"),
        ],
      ),
    );
  }

  Widget _buildButtonItem(IconData icon, String text) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 28.0),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(text,
              style: TextStyle(color: Color(0xff999999), fontSize: 12)),
        )
      ],
    ));
  }

  Widget _buildTabBarBg() {
    return Container(
      //TabBar圆角背景颜色
      height: 50,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Container(color: Colors.green)),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey,
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.white,
              child: ListTile(title: Text("$s第$index 个条目")));
        });
  }
}
