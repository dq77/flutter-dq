import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:flutter_taozugong_app/model/goods/sku.utils.dart';

class SpecificationsPage extends StatefulWidget {
  final text;
  final type;

  SpecificationsPage({Key key, this.text, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CommodityDetailState();
}

class CommodityDetailState extends State<SpecificationsPage> {
  BuildContext _context;
  int num = 1;
  List radioColorList = [
    {'checked': true, 'text': '土豪金'},
    {'checked': false, 'text': '中国红'},
    {'checked': false, 'text': '深空灰'}
  ];
  List radioVersionList = [
    {'checked': true, 'text': '128G'},
    {'checked': false, 'text': '256G'}
  ];
  List rentList = [
    {'checked': true, 'text': '3个月', 'money': '月租￥100/月'},
    {'checked': false, 'text': '4个月', 'money': '月租￥100/月'},
    {'checked': false, 'text': '5个月', 'money': '月租￥100/月'},
    {'checked': false, 'text': '6个月', 'money': '月租￥100/月'},
    {'checked': false, 'text': '7个月', 'money': '月租￥100/月'},
    {'checked': false, 'text': '8个月', 'money': '月租￥100/月'},
  ];

  List payTypes = [
    {'name': '一次性支付', 'value': '1'},
    {'name': '分期支付', 'value': '2'}
  ];

  List specificationVOList = [
    {
      "specificationKeyVO": {
        "name": "内存",
        "id": 100001,
        "sort": 0,
        "status": 10
      },
      "specificationValueVOList": [
        {
          "name": "256G",
          "id": 83,
          "specificationKeyId": 100001,
          "sort": 0,
          "status": 10,
          "picture": null
        }
      ]
    },
    {
      "specificationKeyVO": {
        "name": "尺码",
        "id": 100008,
        "sort": 0,
        "status": 10
      },
      "specificationValueVOList": [
        {
          "name": "XL",
          "id": 60,
          "specificationKeyId": 100008,
          "sort": 0,
          "status": 10,
          "picture": null
        },
        {
          "name": "XXL",
          "id": 61,
          "specificationKeyId": 100008,
          "sort": 0,
          "status": 10,
          "picture": null
        }
      ]
    }
  ];

  Map specItem = {
    "specificationKeyVO": {"name": "内存", "id": 100001, "sort": 0, "status": 10},
    "specificationValueVOList": [
      {
        "name": "256G",
        "id": 83,
        "specificationKeyId": 100001,
        "sort": 0,
        "status": 10,
        "picture": null
      }
    ]
  };

  Widget divider() {
    return new Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        height: 1,
        color: GlobalColor.divideColor);
  }

  Widget productInfo(model) {
    return new Container(
      margin: EdgeInsets.all(20),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: EdgeInsets.only(right: 15.0),
              child: new InkWell(
                onTap: null,
                // Image.network(model.skuImg, fit: BoxFit.cover)
                child: new Image(
                    width: 100, height: 100, image: NetworkImage(model.skuImg),fit: BoxFit.cover),
              )),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width:ScreenUtil().setWidth(400),
                    child: new Text(
                  model.goodsDetail.name,
                  maxLines:2,
                  style: TextStyle(fontSize: 17.0),
                )),
                new Container(
                  margin: EdgeInsets.only(top: 10),
                  child: new Text(
                    '￥ ${model.goodsDetail.minPrice.toString()}',
                    style: TextStyle(
                        color: GlobalColor.moneyColor, fontSize: 16.0),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 10),
                  child: new Text(
                    '已选： ${model.detailNoId}',
                    maxLines:1,
                    style: TextStyle(
                        color: GlobalColor.txtColor333, fontSize: 16.0),
                  ),
                )
              ],
            ),
            flex: 0,
          ),
          new Expanded(
            child: new Container(),
            flex: 10,
          ),
          new Expanded(
            child: new InkWell(
              onTap: () {
                Navigator.pop(_context);
              },
              child: new Icon(Icons.clear),
            ),
            flex: 0,
          )
        ],
      ),
    );
  }

  Widget radioCheckButton(item, list) {
    return new InkWell(
        onTap: () {
          changeColor(item, list);
        },
        child: new ChoiceChip(
          label: Text(item['text'],
              style: TextStyle(color: Colors.white, fontSize: 12)),
          labelStyle: TextStyle(color: Colors.white),
          shape: BeveledRectangleBorder(
              side: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: item['checked'] == true
                      ? Colors.transparent
                      : Color(0xff999999))),
          selected: item['checked'] == true,
          selectedColor: GlobalColor.primaryColor,
          backgroundColor: Colors.white,
          disabledColor: Colors.white,
          onSelected: (value) {
            print('value $value');
            changeColor(item, list);
          },
        ));
  }

  Widget radioButton(item, list) {
    Color textColor = Colors.black;
    Color selectedTextColor = Colors.white;
    return new InkWell(
      onTap: () {
        //changeColor(item, list);
      },
      child: new ChoiceChip(
        clipBehavior: Clip.hardEdge,
        pressElevation: 100.0,
        selected: item['checked'] == true,
        shape: BeveledRectangleBorder(
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: item['checked'] == true
                    ? Colors.transparent
                    : Color(0xff999999))),
        label: Text(item['text'],
            style: TextStyle(
                fontSize: 12,
                color:
                    item['checked'] == true ? selectedTextColor : textColor)),
        labelStyle: TextStyle(color: Colors.white),
        labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
        backgroundColor: Colors.white,
        selectedColor: GlobalColor.primaryColor,
        disabledColor: Colors.red[300],
        onSelected: (value) {
          print('value $value');
          changeColor(item, list);
        },
      ),
    );
  }

  Widget rentButton(item, list) {
    return new InkWell(
        onTap: () {
          changeColor(item, list);
        },
        child: new Container(
          margin: EdgeInsets.only(right: 12, top: 20),
          alignment: Alignment.center,
          width: 100.0,
          height: 45.0,
          decoration: new BoxDecoration(
              border: Border.all(color: GlobalColor.borderColor, width: 1)),
          child: new Column(
            children: <Widget>[
              new Text(
                item['text'],
                style: TextStyle(color: GlobalColor.color999, fontSize: 14),
              ),
              new Text(
                item['money'],
                style: TextStyle(color: GlobalColor.color999, fontSize: 10),
              )
            ],
          ),
        ));
  }

  Widget rentCheckedButton(item, list) {
    return new InkWell(
        onTap: () {
          changeColor(item, list);
        },
        child: new Container(
          padding: EdgeInsets.only(top: 3.0),
          margin: EdgeInsets.only(right: 12, top: 20),
          alignment: Alignment.center,
          width: 100.0,
          height: 45.0,
          color: GlobalColor.baseColor,
          child: new Column(
            children: <Widget>[
              new Text(
                item['text'],
                style:
                    TextStyle(color: GlobalColor.whiteWordColor, fontSize: 14),
              ),
              new Text(
                item['money'],
                style:
                    TextStyle(color: GlobalColor.whiteWordColor, fontSize: 10),
              )
            ],
          ),
        ));
  }

  Widget param(paramName, type) {
    return new Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
      child: new Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              paramName,
              style: TextStyle(fontSize: 14),
            ),
          ),
          type == 'color'
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: new Wrap(
                      spacing: 4.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      children: radioColorList
                          .map((i) => radioButton(i, radioColorList))
                          .toList()))
              : type == 'version'
                  ? Container(
                      alignment: Alignment.centerLeft,
                      child: new Wrap(
                          spacing: 4.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          children: radioVersionList
                              .map((i) => i['checked']
                                  ? radioCheckButton(i, radioVersionList)
                                  : radioButton(i, radioVersionList))
                              .toList()))
                  : Container(
                      alignment: Alignment.centerLeft,
                      child: new Wrap(
                          spacing: 4.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          children: rentList
                              .map((i) => i['checked']
                                  ? rentCheckedButton(i, rentList)
                                  : rentButton(i, rentList))
                              .toList()))
        ],
      ),
    );
  }

  void changeColor(item, list) {
    print('aaa');
    for (var i = 0; i < list.length; i++) {
      setState(() {
        list[i]['checked'] = false;
      });
      if (list[i]['text'] == item['text']) {
        setState(() {
          list[i]['checked'] = true;
        });
      }
    }
  }

  Widget numOption(model) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0, top: 10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text('数量'),
          new Expanded(
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 5),
                      width: 30.0,
                      height: 30.0,
                      color: GlobalColor.backPageColor,
                      child: new InkWell(
                        onTap: model.reduce,
                        child: new Text('-', style: TextStyle(fontSize: 20)),
                      )),
                  flex: 0,
                ),
                new Expanded(
                  child: new Container(
                      margin: EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      width: 40.0,
                      height: 30.0,
                      color: GlobalColor.backPageColor,
                      child: new InkWell(
                        onTap: null,
                        child: new Text(model.amount.toString()),
                      )),
                  flex: 0,
                ),
                new Expanded(
                  child: new Container(
                      alignment: Alignment.center,
                      width: 30.0,
                      height: 30.0,
                      color: GlobalColor.backPageColor,
                      child: new InkWell(
                        onTap: model.add,
                        child: new Text(
                          '+',
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  flex: 0,
                )
              ],
            ),
            flex: 0,
          ),
        ],
      ),
    );
  }

 
  Widget skuItem(model,specVOItem) {
    print('LALLALLALAL ${specVOItem.specificationKeyVO.toString()}');
    print('LALLALLALAL ${specVOItem.specificationValueVOList.toString()}');
    return Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              '${specVOItem.specificationKeyVO.name}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: buildChoiceButton(model,specVOItem.specificationValueVOList))
        ]));
  }

  Widget buildChoiceButton(model,specificationValueVOList) {
    List<Widget> choiceButtons =
        []; //先建一个数组用于存放循环生成的widget //单独一个widget组件，用于返回需要生成的内容widget
    for (var item in specificationValueVOList) {
      choiceButtons.add(skuRadioButton(model,item));
    }
    return new Wrap(
        spacing: 4.0,
        runSpacing: 0.0,
        alignment: WrapAlignment.start,
        children: choiceButtons);
  }

  Widget buildSkuItem(model,specificationVOList) {

    List<Widget> skuItems = []; //先建一个数组用于存放循环生成的widget
    for (var item in specificationVOList) {
      skuItems.add(skuItem(model,item));
    }

    return Column(children: skuItems);
  }

  Widget buildPayTypeItem(model,payTypes) {
    List<Widget> choiceButtons =
        []; //先建一个数组用于存放循环生成的widget //单独一个widget组件，用于返回需要生成的内容widget
    for (var item in payTypes) {
      choiceButtons.add(payTypeRadioButton(model,item));
    }

    return Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              '支付方式',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: new Wrap(
                  spacing: 4.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  children: choiceButtons))
        ]));

    // return new Wrap(
    //     spacing: 4.0,
    //     runSpacing: 0.0,
    //     alignment: WrapAlignment.start,
    //     children: choiceButtons);
  }

  Widget buildSkuStageItem(model,skuStageItem,type) {
    List<Widget> choiceButtons =
        []; //先建一个数组用于存放循环生成的widget //单独一个widget组件，用于返回需要生成的内容widget
    for (var item in skuStageItem?.skuStageVOList) {
      choiceButtons.add(stageRadioButton(model,item));
    }

    return Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              '${model.businessType == 0 ? '租期选择':'分期数'}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: new Wrap(
                  spacing: 4.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  children: choiceButtons))
        ]));

  }

  Widget payTypeRadioButton(model,item) {
    Color textColor = Colors.black;
    Color selectedTextColor = Colors.white;
    return new InkWell(
      onTap: () {
        //changeColor(item, list);
        print('支付方式 ${item.toString()}');
      },
      child: new ChoiceChip(
        clipBehavior: Clip.hardEdge,
        pressElevation: 100.0,
        selected: item['value'] == model.selectedPayType['value'],
        shape: BeveledRectangleBorder(
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: item['value'] == model.selectedPayType['value']
                    ? Colors.transparent
                    : Color(0xff999999))),
        label: Text(item['name'],
            style: TextStyle(
                fontSize: 12,
                color:
                    item['value'] == model.selectedPayType['value'] ? selectedTextColor : textColor)),
        labelStyle: TextStyle(color: Colors.white),
        labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
        backgroundColor: Colors.white,
        selectedColor: GlobalColor.primaryColor,
        disabledColor: Colors.red[300],
        onSelected: (value) {
          print('value $value');
          print('支付方式 ${item.toString()}');
          model.changePayType(item);
          //changeColor(item, list);
        },
      ),
    );
  }


  // 商品规格button
  Widget skuRadioButton(model,item) {
    Color textColor = Colors.black;
    Color selectedTextColor = Colors.white;
    return new ChoiceChip(
      clipBehavior: Clip.hardEdge,
      //pressElevation: 100.0,
      selected: SkuUtil.isSelectedItem(model.selectedSpecs,item),
      shape: BeveledRectangleBorder(
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: SkuUtil.isSelectedItem(model.selectedSpecs,item)
                    ? Colors.transparent
                    : Color(0xff999999))),
      label: Text('${item.name}',
          style: TextStyle(
              fontSize: 12,
              color: SkuUtil.isSelectedItem(model.selectedSpecs,item) ? selectedTextColor : textColor)),
      labelStyle: TextStyle(color: Colors.white),
      labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      backgroundColor: Colors.white,
      selectedColor: GlobalColor.primaryColor,
      disabledColor: Colors.red[300],
      onSelected: (value) {
        print('value $value');
        print('当前点击的项 ${item}');
        model.changeSkuChecked(item);
        // childchangeColor(item, list);
      },
    );
  }

  // 商品租期button
  Widget stageRadioButton(model,item) {
    Color textColor = Colors.black;
    Color selectedTextColor = Colors.white;
    String lableText = model.businessType == 0 ? '${item.stageNumber} ${item.unit == 'DAY' ? '天':'月'}':'￥${item.stagePrice} * ${item.stageNumber}';
    return new ChoiceChip(
      clipBehavior: Clip.hardEdge,
      //pressElevation: 100.0,
      //SkuUtil.isSelectedItem(model.selectedSpecs,item)
      selected: model.selectedStage == item,
      shape: BeveledRectangleBorder(
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: model.selectedStage == item
                    ? Colors.transparent
                    : Color(0xff999999))),
      label: Text(lableText,
          style: TextStyle(
              fontSize: 12,
              color: model.selectedStage == item ? selectedTextColor : textColor)),
      labelStyle: TextStyle(color: Colors.white),
      labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      backgroundColor: Colors.white,
      selectedColor: GlobalColor.primaryColor,
      disabledColor: Colors.red[300],
      onSelected: (value) {
        print('value $value');
        print('当前点击的项 ${item}');
        model.changeStageChecked(item);
        // childchangeColor(item, list);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    this._context = context;
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: null,
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 10.0,bottom: 20.0),
            child: new ListView(
              children: <Widget>[
                productInfo(model),
                divider(),
                // Text(model.specificationVOList.toString()),
                buildSkuItem(model,model.specificationVOList),
                // skuItem(specItem),
                // divider(),
                // param('颜色', 'color'),
                // divider(),
                // param('版本', 'version'),
                
                divider(),
                buildSkuStageItem(model,model.skuStageItem,'zulin'),
                divider(),
                buildPayTypeItem(model,payTypes),
                // divider(),
                // buildSkuStageItem(model,model.skuStageItem,'sale'),
                // param('租期选择', 'rent'),
                divider(),
                numOption(model),
                divider(),
              ],
            )),
        bottomSheet: model.businessType == 0 ? Container(
          height: 82,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.0,bottom: 5.0,top: 5.0),
                child: model.businessType == 0 ? Text('租赁押金：￥0 信用免押'):Text('购买'),
              ),
              InkWell(
              onTap: () {
                // 在这里做校验是否有库存及是否可以下单
                Application.router.navigateTo(context, "/orderConfirm",
                    transition: TransitionType.inFromRight);
              },
              child: new Container(
                alignment: Alignment.center,
                height: 52,
                color: GlobalColor.baseColor,
                child: new Text(
                  model.businessType == 0 ? '立即租赁' : '立即购买',
                  style:
                      TextStyle(color: GlobalColor.whiteWordColor, fontSize: 16),
                ),
              ))
            ],
          ),
        ):InkWell(
              onTap: () {
                // 在这里做校验是否有库存及是否可以下单
                Application.router.navigateTo(context, "/orderConfirm",
                    transition: TransitionType.inFromRight);
              },
              child: new Container(
                alignment: Alignment.center,
                height: 52,
                color: GlobalColor.baseColor,
                child: new Text(
                  model.businessType == 0 ? '立即租赁' : '立即购买',
                  style:
                      TextStyle(color: GlobalColor.whiteWordColor, fontSize: 16),
                ),
              )),
      );
    });
  }
}
