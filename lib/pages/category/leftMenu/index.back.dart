import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class CategoryMenue extends StatefulWidget {
  final List items;
  final double itemHeight;
  final double itemWidth;
  final ValueChanged<int> menueTaped;
  CategoryMenue(
      {Key key, this.items, this.itemHeight, this.itemWidth, this.menueTaped})
      : super(key: key);
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
    int len = widget.items.length;
    List<Widget> widgets = List.generate(len, (i) {
      return InkWell(
        onTap: () => _menueTaped(widget.items[i]['id']),
        child: Container(
            height: widget.itemHeight,
            alignment: Alignment.center,
            child: Text(
              widget.items[i]['name'],
              style: TextStyle(
                  fontSize: currentItemIndex == i ? 16 : 16,
                  fontWeight:
                      currentItemIndex == i ? FontWeight.w500 : FontWeight.w300,
                  color: currentItemIndex == i
                      ? GlobalColor.baseColor
                      : GlobalColor.blackWordColor),
            )),
      );
    });

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
        Column(children: widgets)
      ],
    );
  }

  _menueTaped(int i) {
    widget.menueTaped(i);
    moveToTap(i);
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
