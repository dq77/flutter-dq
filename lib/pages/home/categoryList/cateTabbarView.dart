import 'package:flutter/material.dart';

import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/service/goods/index.dart';
import 'package:flutter_taozugong_app/model/category/entity.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';



class CategoryTabBarView extends StatefulWidget {

  final int categoryId;
  CategoryTabBarView({Key key, this.categoryId}) : super(key: key);

  @override
  _CategoryTabBarViewState createState() => _CategoryTabBarViewState();
}

class _CategoryTabBarViewState extends State<CategoryTabBarView> {

  List _goodsList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('获取分类id ${widget.categoryId}');
    this.getGoodsByCategoryId(widget.categoryId);

  }

  void getGoodsByCategoryId(categoryId) async {
    
    // var goodsList = await GoodsApiInterface.getGoodsByCategoryId(
    //     channel: "APP", channelCategoryId: categoryId, page: 1, pageSize: 10);
    
    print('获取默认分类下的商品列表 ${categoryId}');
    var categoryGoodsListRes = await GoodsApiInterface.getGoodsByCategoryId(channelCategoryId: categoryId, page: 1, pageSize: 10);
    print('获取默认分类下的商品列表1 ${categoryGoodsListRes.toString()}');
    var categoryGoodsListEntity = new CategoryGoodsListResp.fromJson(categoryGoodsListRes); 
    print('获取默认分类下的商品列表2 ${categoryGoodsListEntity.toString()}');

    if (categoryGoodsListEntity.code == 200) {
      setState(() {        
        _goodsList = categoryGoodsListEntity?.data?.list;
      });
    } else {
      Toast.show('${categoryGoodsListEntity.subMsg}');
    }

    print('商品列表 ${categoryGoodsListEntity.data.toString()}');
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _categoryView(),
    );
  }


  // 构建TabView
  // List<Widget> buildTabViews(model) {
  //   List<Widget> tabViews = [];
  //   for (var cate in model.categoryData) {
  //     tabViews.add(_categoryView(model:model));
  //     print('${cate.name}');
  //   }

  //   print('${tabViews.toList().toString()}');
  //   return tabViews.toList();
  // }

  // 分类View
  Widget _categoryView({model}) {
    return Container(
        //margin: EdgeInsets.only(top:70.0),
        child: _goodsList.isEmpty
            ? Center(child: Text('当前类目下还没有数据哦'))
            : GridView.count(
                //横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
                crossAxisCount: 2,
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                //主轴间隔
                mainAxisSpacing: 4.0,
                childAspectRatio: 2 / 3.5,
                //横轴间隔
                crossAxisSpacing: 4.0,
                // shrinkWrap: true,
                // physics: new NeverScrollableScrollPhysics(),
                children: _buildGridTileList(_goodsList),
              ));
  }

  List<Container> _buildGridTileList(List goodsList) {
    return new List.generate(
        goodsList.length,
        (int index) => new Container(
              child: _goodsItemWidget(goodsList[index]),
            ));
  }

  Widget _goodsItemWidget(goodsItem) {
    return InkWell(
      onTap: () {
        // Router.push(context, new _goodsItemWidgetDetail(no:1));
        Application.router.navigateTo(
            context, "/goodsDetail?no=${goodsItem.no}",
            transition: TransitionType.inFromLeft);
      },
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            new Container(
              color: Colors.white,
              padding: EdgeInsets.all(0.0),
              height: 164,
              child: Image.network(
                goodsItem.headFigure,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
                child: Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 8.0, top: 3.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    goodsItem.name,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 16.0,
                        height: 1.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 8.0, top: 5.0),
                  alignment: Alignment.centerLeft,
                  child: buildLabel(context,goodsItem.goodsLabel),
                ),
                new Container(
                    padding: EdgeInsets.only(left: 8.0, top: 10.0),
                    alignment: Alignment.centerLeft,
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          '￥${goodsItem.minPrice}',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                        new Text(
                          ' /${goodsItem.unit}',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        )
                      ],
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(context, goodsLabels) {
  List<Widget> labels = []; //先建一个数组用于存放循环生成的widget
  Widget labelContent; //单独一个widget组件，用于返回需要生成的内容widget
  for (var item in goodsLabels) {
    labels.add(
      new Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(right: 5.0, bottom: 8.0),
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
          child: new Text(
            '${item}',
            style: TextStyle(color: GlobalColor.baseColor, fontSize: 10.0),
          ),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              border:
                  new Border.all(color: GlobalColor.baseColor, width: 0.5))),
    );
  }

  labelContent = new Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: labels
    );

  return labelContent;
}
}