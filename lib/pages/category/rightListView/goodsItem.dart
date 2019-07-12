import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/components/goodItem/index.dart';
import 'package:flutter_taozugong_app/model/categoryPage/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultItemModal {
  String shopName;
  String wareName;
  String price;
  String imageUrl;
  SearchResultItemModal(
      {this.shopName, this.price, this.imageUrl, this.wareName});
}

List resultList = [
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553159316&di=1a606901c3bac0dedb32f4d16358c6f8&imgtype=jpg&er=1&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fcrop.0.0.1997.1125%2F90eb2137ly1fphycfgw8rj21jk0v9e81.jpg'),
  new SearchResultItemModal(
      shopName: '888',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552564596785&di=84191d7ec9b137fdf337a4d8bc78e511&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2F5Ajhpdm3u4Fc7MiuneJ9c52dZ0t8mXlmfhjRETxkeXINS1536309584407compressflag.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552564780951&di=4cf4a16a6c3abbf28b47dae06f08cf38&imgtype=0&src=http%3A%2F%2Fwww.th7.cn%2Fd%2Ffile%2Fp%2F2016%2F07%2F28%2F7211031fba2ecf121040257780ace6ac.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553159316&di=1a606901c3bac0dedb32f4d16358c6f8&imgtype=jpg&er=1&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fcrop.0.0.1997.1125%2F90eb2137ly1fphycfgw8rj21jk0v9e81.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552564596785&di=84191d7ec9b137fdf337a4d8bc78e511&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2F5Ajhpdm3u4Fc7MiuneJ9c52dZ0t8mXlmfhjRETxkeXINS1536309584407compressflag.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552564780951&di=4cf4a16a6c3abbf28b47dae06f08cf38&imgtype=0&src=http%3A%2F%2Fwww.th7.cn%2Fd%2Ffile%2Fp%2F2016%2F07%2F28%2F7211031fba2ecf121040257780ace6ac.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553159316&di=1a606901c3bac0dedb32f4d16358c6f8&imgtype=jpg&er=1&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fcrop.0.0.1997.1125%2F90eb2137ly1fphycfgw8rj21jk0v9e81.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552564596785&di=84191d7ec9b137fdf337a4d8bc78e511&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2F5Ajhpdm3u4Fc7MiuneJ9c52dZ0t8mXlmfhjRETxkeXINS1536309584407compressflag.jpg'),
  new SearchResultItemModal(
      shopName: 'kar98',
      wareName:
          '【送信号枪】AWM吃鸡同款枪M416电动男孩玩具枪M24绝地求生98K手动下供弹模型枪 大号AWM（赠两万+8倍镜+信号枪） 官方标配',
      price: '98',
      imageUrl:
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552564780951&di=4cf4a16a6c3abbf28b47dae06f08cf38&imgtype=0&src=http%3A%2F%2Fwww.th7.cn%2Fd%2Ffile%2Fp%2F2016%2F07%2F28%2F7211031fba2ecf121040257780ace6ac.jpg')
];

class SecondryCategory extends StatelessWidget {
  final SubCategoryListModel data;
  SecondryCategory({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    double bannerWidth = ScreenUtil().setWidth(548);
    double bannerHeight = ScreenUtil().setHeight(184);

    return Column(
      children: <Widget>[
        // Image.network(
        //   data.banner,
        //   height: bannerHeight,
        //   width: bannerWidth,
        // ),
        new Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: resultList.map((i) {
                return itemBuilder(context, i, 140.0, 140.0);
              }).toList(),
            )),
      ],
    );
  }
}



class SubCategoryList extends StatefulWidget {
  final double height;
  final SubCategoryListModel data;
  final void Function(String) goPage;
  SubCategoryList({Key key, this.height, this.goPage, this.data})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => SubCategoryListState();
}

class SubCategoryListState extends State<SubCategoryList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: this.dragend,
      child: Container(
        height: widget.height,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 13, bottom: 40),
            controller: controller,
            //  physics: NeverScrollableScrollPhysics(),
            child: Container(
              child: widget.data != null
                  ? SecondryCategory(
                      data: widget.data,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              constraints: BoxConstraints(minHeight: widget.height + 5),
            )),
      ),
    );
  }

  dragend(e) {
    double offset = controller.offset;
    double maxExtentLenght = controller.position.maxScrollExtent;
    // print('offset' +
    //     offset.toString() +
    //     "     maxextentlength" +
    //     maxExtentLenght.toString());
    // print(widget.goPage);
//    if (offset < -50) {
//      widget.goPage('pre');
//    }
//    if (offset - maxExtentLenght > 50) {
//      widget.goPage('next');
//    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
