//地址管理
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';

class AddressManagement extends StatefulWidget {
  final String fromPage;
  AddressManagement({Key key, this.fromPage}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new AddressManagementState();
}

class AddressManagementState extends State<AddressManagement> {
  BuildContext _context;

  Model getModel(BuildContext context) {
    // final globalModel = ScopedModel.of(GlobalModel)(context);
    print(context);
    final globalModel = GlobalModel().of(context);
    globalModel.getUserAddressList();

    return globalModel;
  }

  @override
  void initState() {
    super.initState();
    final globalModel = GlobalModel().of(context);
    if (widget.fromPage != 'orderConfirm' ||
        globalModel.addressList.length == 0) {
      getModel(context);
    }
  }

  Widget addressItem(model, item) {
    Widget defaultIcon = item.isDefault == 0
        ? SizedBox(height: 1.0)
        : Container(
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 6, right: 6),
            decoration: BoxDecoration(
              color: GlobalColor.buttonColor,
              borderRadius: BorderRadius.all(const Radius.circular(50.0)),
            ),
            child: Text(
              '${item.isDefault == 0 ? '' : '默认'}',
              style:
                  TextStyle(color: GlobalColor.whiteWordColor, fontSize: 10.0),
            ),
          );

    Widget checkedIcon = widget.fromPage == null
        ? SizedBox(height: 1.0)
        : InkWell(
            onTap: () async {
              print('切换选中的地址');
              print('切换选中的地址 ${item.id == model.orderDefaultAddress.id}');

              await model.changeSelectedAddress(item);
              print('切换选中的地址 ${model.orderDefaultAddress.toString()}');
              Application.router.pop(context);
            },
            child: Image.asset(
              item.id == model.orderDefaultAddress.id
                  ? Utils.getImgPath("address/checked")
                  : Utils.getImgPath("address/check"),
              width: 28.0,
              height: 28.0,
            ));
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10.0),
      decoration: BoxDecoration(
        color: GlobalColor.whiteWordColor,
        border: Border(
          bottom: BorderSide(color: GlobalColor.divideColor, width: 1),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Column(
              children: <Widget>[defaultIcon, checkedIcon],
            )),
            flex: 1,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 0),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Wrap(children: <Widget>[
                        Text(
                          '${item.province}${item.city}${item.area}${item.detail}',
                          maxLines: 3,
                          style: TextStyle(fontSize: GlobalFont.fontSize12),
                        ),
                      ]),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Text('${item.receiveName}',
                              style: TextStyle(
                                  fontSize: GlobalFont.fontSize11,
                                  color: GlobalColor.color999)),
                          SizedBox(width: 8.0),
                          Text('${item.mobile}',
                              style: TextStyle(
                                  fontSize: GlobalFont.fontSize12,
                                  color: GlobalColor.color999)),
                        ],
                      ),
                    ),
                  ],
                )),
            flex: 9,
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  //model.getAddressInfo(item.id);
                  Application.router.navigateTo(
                      context, "/addressEdit?type=edit&id=${item.id}",
                      transition: TransitionType.inFromBottom);
                },
                child: Container(
                    child: Icon(
                  Icons.edit,
                  size: 20,
                ))),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  model.deleteAddress(item.id);
                },
                child: Container(
                    child: Icon(
                  Icons.delete,
                  size: 20,
                ))),
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      height: 56.0,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 12,
              child: GestureDetector(
                  onTap: () {
                    Application.router.navigateTo(
                        context, "/addressEdit?type='add'",
                        transition: TransitionType.inFromBottom);
                  },
                  child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      color: GlobalColor.buttonColor,
                      child: Text(
                        '新增收货地址',
                        style: TextStyle(
                            color: GlobalColor.whiteWordColor, fontSize: 16.0),
                      )))),
        ],
      ),
    );
  }

  List<Widget> buildAddressList(model, addressListModel) {
    print('地址列表 ${addressListModel.toString()}');

    List<Widget> addressList = []; //先建一个数组用于存放循环生成的widget
    for (var item in addressListModel) {
      addressList.add(addressItem(model, item));
    }

    return addressList;
  }

  // Widget buildChoiceButton(model,specificationValueVOList) {
  //   List<Widget> choiceButtons =
  //       []; //先建一个数组用于存放循环生成的widget //单独一个widget组件，用于返回需要生成的内容widget

  //   return new Wrap(
  //       spacing: 4.0,
  //       runSpacing: 0.0,
  //       alignment: WrapAlignment.start,
  //       children: choiceButtons);
  // }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    final double topPadding = MediaQuery.of(context).padding.top;
    print(topPadding);
    double height = MediaQuery.of(context).size.height;
    var warpHeight = MediaQuery.of(context).size.height - 90.0;
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: GlobalColor.blackWordColor),
          centerTitle: true,
          backgroundColor: GlobalColor.whiteWordColor,
          title: Text(
            '收货地址',
            style: TextStyle(
                fontSize: GlobalFont.fontSize18,
                color: GlobalColor.blackWordColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 12.0),
          child: ListView(
            children: buildAddressList(model, model.addressList),
          ),
        ),
        bottomSheet: footer(),
      );
    });
  }
}
