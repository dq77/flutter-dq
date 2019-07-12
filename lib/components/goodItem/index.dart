import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/common/resources.dart';

Widget itemBuilder(context, item, width, height) {
  return Container(
    color: GlobalColor.whiteWordColor,
    padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setWidth(10),
        horizontal: ScreenUtil().setWidth(16)),
    child: InkWell(
      onTap: () {
        Application.router.navigateTo(context, "/goodsDetail?no=${item.no}",
            transition: TransitionType.inFromRight);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            item.headFigure,
            width: ScreenUtil().setWidth(width),
            height: ScreenUtil().setWidth(height),
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: 16, left: 2),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.1,
              color: GlobalColor.greyColor,
            ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 0, top: 3.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.name,
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                // Text(
                //   item.name,
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(
                //       fontSize: GlobalFont.fontSize12,
                //       color: GlobalColor.color999),
                // ),
                new Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: buildLabel(context,item.goodsLabel),
                ),
                new Container(
                    padding: EdgeInsets.only(left: 0, bottom: 5.0),
                    alignment: Alignment.centerLeft,
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          '￥${item.minPrice}',
                          style: TextStyle(
                              color: GlobalColor.redColor,
                              fontSize: GlobalFont.fontSize14),
                        ),
                        new Text(
                          item.businessType != 0 ? '' : '/${item.unit}',
                          style: TextStyle(
                              color: GlobalColor.color999,
                              fontSize: GlobalFont.fontSize12),
                        )
                      ],
                    )),
                Divider(color: Colours.border_gray)
              ],
            ),
          ))
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
