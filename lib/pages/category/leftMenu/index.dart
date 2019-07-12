import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/model/category/entity.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

class CategoryMenue extends StatefulWidget {
  final double itemHeight;
  final double itemWidth;
  CategoryMenue({Key key, this.itemHeight, this.itemWidth}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryMenueState();
}

class CategoryMenueState extends State<CategoryMenue>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  int currentItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Stack(
        children: <Widget>[
          Positioned(
              width: widget.itemWidth,
              height: widget.itemHeight,
              top: animation.value,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Color(0xFFFFFFFF),
                  ),
                  Positioned(
                    top: 16,
                    child: Container(
                      width: 3,
                      height: 36,
                      color: GlobalColor.baseColor,
                    ),
                  )
                ],
              )),
          Column(children: _buildLeftTabs(model))
        ],
      );
    });
  }

  List<Widget> _buildLeftTabs(model) {
    
    List<CategoryData> categoryData = model.categoryData;
    int _defaultCategoryId = model.defaultCategoryId;
    if(categoryData == null || categoryData?.length == 0) return [];
    int len = categoryData.length;
    List<Widget> widgets = List.generate(len, (i) {
      return InkWell(
        onTap: () => _menueTaped(model,categoryData[i]?.id,i),
        child: Container(
            height: widget.itemHeight,
            alignment: Alignment.center,
            child: Text(
              categoryData[i]?.name,
              style: TextStyle(
                  fontSize: _defaultCategoryId == categoryData[i]?.id ? 16 : 16,
                  fontWeight:
                      _defaultCategoryId == categoryData[i]?.id ? FontWeight.w500 : FontWeight.w300,
                  color: _defaultCategoryId == categoryData[i]?.id
                      ? GlobalColor.baseColor
                      : GlobalColor.blackWordColor),
            )),
      );
    });

    return widgets;
  }

  _menueTaped(model,int id,int index) {
    print('你当前点击了 ${id}');
    model.changeDefaultCategoryId(id);
    //widget.menueTaped(i);
    moveToTap(index);
  }

  moveToTap(int i) {
    double begin = currentItemIndex * widget.itemHeight;
    double end = i * widget.itemHeight;
    //print('begin'+begin.toString()+"-----"+end.toString());
    animation = Tween(begin: begin, end: end)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        //  print(currentItemIndex);
        currentItemIndex = i;
      }
    });

    controller.forward(from: 0);
  }

  initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(controller);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
