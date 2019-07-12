// 商品展示列

import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/service/goods/index.dart';

class CateGoodslist extends StatefulWidget {
  final Map cateItem;
  CateGoodslist({Key key, this.cateItem}) : super(key: key);

  @override
  _CateGoodslistState createState() => new _CateGoodslistState();
}

class _CateGoodslistState extends State<CateGoodslist> {
  List<Container> _buildGridTileList(List goodsList) {
    return new List.generate(
        goodsList.length,
        (int index) => new Container(
              child: commodity(goodsList[index]),
            ));
  }

  List _goodsList = [];

  void initState() {
    super.initState();
    this.getGoodsByCategoryId(widget.cateItem['id']);
    print('初始化 ${widget.cateItem['id']} ${widget.cateItem['name']}');
  }

  void getGoodsByCategoryId(categoryId) async {
    var goodsList = await GoodsApiInterface.getGoodsByCategoryId(
        channel: "APP", channelCategoryId: categoryId, page: 1, pageSize: 10);

    if (goodsList['code'] == 200) {
      setState(() {
        _goodsList = goodsList['data']['list'];
      });
    }

    print('商品列表 ${goodsList['data'].toString()}');
  }

  Widget commodity(goodsItem) {
    return InkWell(
      onTap: () {
        // Router.push(context, new CommodityDetail(no:1));
        print('LALALA ${widget.cateItem}');
        print('LALALA ${_goodsList.toString()}');
        print('LAL ${goodsItem}');
        Application.router.navigateTo(
            context, "/goodsDetail?no=${goodsItem['no']}",
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
                goodsItem['headFigure'],
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
                    goodsItem['name'],
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
                  child: new Container(
                      width: 50.0,
                      padding: EdgeInsets.only(
                          top: 2.0, left: 3.0, bottom: 2.0, right: 3.0),
                      child: new Text(
                        '12期免息',
                        style: TextStyle(
                            color: GlobalColor.baseColor, fontSize: 10.0),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2.0),
                          ),
                          border: new Border.all(
                              color: GlobalColor.baseColor, width: 1.0))),
                ),
                new Container(
                    padding: EdgeInsets.only(left: 8.0, top: 10.0),
                    alignment: Alignment.centerLeft,
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          '${goodsItem['minPrice']}',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                        new Text(
                          ' /${goodsItem['unit']}',
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

  @override
  Widget build(BuildContext context) {
    print('LENGTH ${_goodsList.length}');
    return new Container(
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
}
