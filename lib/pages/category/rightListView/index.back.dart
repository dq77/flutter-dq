import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/model/categoryPage/index.dart';
import 'goodsItem.dart';

class RightListView extends StatefulWidget {
  final double height;
  final List<SubCategoryListModel> dataItems;
  final ValueChanged<int> listViewChanged;
  RightListView({Key key, this.height, this.dataItems, this.listViewChanged})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => RightListViewState();
}

class RightListViewState extends State<RightListView> {
  int currentPage = 0;
  bool isAnimating = false;
  int itemCount = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    itemCount = widget.dataItems.length;
    print('ItemCount   ${widget.height}');
    
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(), //禁用手动滑动，于是有了上面的注释
        padding: EdgeInsets.all(0),
        controller: controller,
        itemBuilder: _itembuilder,
        itemCount: itemCount,
        itemExtent: widget.height,
      ),
      // ),
    );
  }

  Widget _itembuilder(BuildContext context, int index) {
    var data = widget.dataItems[index];
    return SubCategoryList(data: data, height: widget.height);
  }

  void goPage(String tag) {
    if (this.isAnimating) return;
    if (tag == 'pre') {
      if (currentPage == 0) {
        return;
      } else {
        currentPage--;
      }
    } else {
      if (currentPage == itemCount - 1) {
        return;
      } else {
        currentPage++;
      }
    }
    widget.listViewChanged(currentPage);
    animateTopage(currentPage);
  }

  jumpTopage(int i) async {
    currentPage = i;
    double offset = widget.height * i;
    this.controller.jumpTo(offset);
  }

  animateTopage(int i) {
    if (this.isAnimating) return;
    currentPage = i;
    this.isAnimating = true;
    double offset = widget.height * i;
    this
        .controller
        .animateTo(offset,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut)
        .then((onValue) => this.isAnimating = false);
  }
}
