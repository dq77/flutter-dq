import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/address.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/agreement.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/infoInput.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

import 'dart:math';
import 'package:common_utils/common_utils.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// 确认订单页面

class OrderConfirmPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderConfirmState();
}

class OrderConfirmState extends State<OrderConfirmPage> {
  BuildContext _context;
  final TextEditingController _idcardNumberController =
      new TextEditingController();
  final TextEditingController _remarkController = new TextEditingController();

  @override
  initState() {
    super.initState();

    print('订单确认页数据开始准备');
    getConfirmOrderData();
  }

  // 获取订单确认页数据
  void getConfirmOrderData() async {
    final globalModel = GlobalModel().of(context);
    // 如果没有默认地址那么就请求一次接口列表
    if (globalModel.orderDefaultAddress == null) {
      print('会进来么');
      await globalModel.getUserAddressList();
    }
    // 获取订单确认页数据
    await globalModel.getConfirmData(globalModel.selectedPayType["value"], [
      {
        "count": globalModel.amount,
        "stageNumber": globalModel.selectedStage.stageNumber,
        "skuId": globalModel.skuStageItem.id,
        "unit": globalModel.selectedStage.unit
      }
    ]);
  }

  // 创建订单
  void createOrder() async {
    print('创建订单接口');
    final globalModel = GlobalModel().of(context);
    await globalModel.createOrder(
      globalModel.orderDefaultAddress.id,
      [
        { 
            "skuId": globalModel.skuStageItem?.id,
            "count": globalModel.amount,
            "stageNumber": globalModel.selectedStage?.stageNumber,
            "unit": globalModel.selectedStage.unit
        }
      ],
      globalModel.orderConfirmData.deposit.toString(),
      globalModel.orderConfirmData.firstPay.toString(),
      'ALIPAY_AUTH',
      globalModel.selectedPayType['value'],
      "flutter://taozugong",
      tradeType:"",
      idCard:"342225199409282816"
    );

  }



  Widget build(BuildContext context) {
    this._context = context;

    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {

      double couponMoney = model.orderConfirmData?.couponList[0]?.couponMoney;
      String amountPayable = MoneyUtil.changeYWithUnit("${model.orderConfirmData?.totalRent - couponMoney}", MoneyUnit.YUAN,format: MoneyFormat.YUAN_INTEGER);
      String amountFirstPayable = MoneyUtil.changeYWithUnit("${model.orderConfirmData?.firstPay - couponMoney}", MoneyUnit.YUAN,format: MoneyFormat.YUAN_INTEGER);
      
      print('支付金额payAmount ${amountFirstPayable}');
      // String moneyTxt = MoneyUtil.changeFStr2YWithUnit("1160", format: MoneyFormat.NORMAL, unit: MoneyUnit.YUAN_ZH);
      // String moneyTxt2 = MoneyUtil.changeYWithUnit("1.66", MoneyUnit.YUAN_ZH);


      return new Scaffold(
        backgroundColor: GlobalColor.backPageColor,
        appBar: new AppBar(
          backgroundColor: GlobalColor.whiteWordColor,
          elevation: 0.2,
          iconTheme: IconThemeData(color: GlobalColor.blackWordColor),
          title: new Text(
            '确认订单',
            style: TextStyle(color: GlobalColor.blackWordColor),
          ),
          centerTitle: true,
        ),
        body: new Container(
            height: MediaQuery.of(_context).size.height - 145,
            child: ListView(
              children: <Widget>[
                //noAddress(),
                model.orderDefaultAddress == null
                    ? noAddress(context, model)
                    : hasAddress(context, model.orderDefaultAddress),
                new Container(
                  color: GlobalColor.whiteWordColor,
                  margin: EdgeInsets.only(top: 10),
                  child: new Column(
                    children: <Widget>[
                      productInfo(model),
                      new Container(
                        height: 1.0,
                        color: GlobalColor.backPageColor,
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      ),
                      rentTime(model)
                    ],
                  ),
                ),
                deposit(model),
                listItem('优惠券', '- ￥${model.orderConfirmData?.couponList[0]?.couponMoney}'),
                // 支付方式  分期详情
                new Container(
                  color: GlobalColor.whiteWordColor,
                  margin: EdgeInsets.only(top: 10),
                  child: new Column(
                    children: <Widget>[
                      listItem('支付方式', '支付宝预授'),
                      new Container(
                        height: 1.0,
                        color: GlobalColor.backPageColor,
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      ),
                      listItem('应付金额', '￥${amountPayable}'),
                      new Container(
                        height: 1.0,
                        color: GlobalColor.backPageColor,
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      ),
                      stagesDetail()
                    ],
                  ),
                ),
                //身份证和备注输入框
                new Container(
                  color: GlobalColor.whiteWordColor,
                  margin: EdgeInsets.only(top: 10),
                  child: new Column(
                    children: <Widget>[
                      initInput('身份证（必填）', '快递需要实名认证', _idcardNumberController),
                      new Container(
                        height: 1.0,
                        color: GlobalColor.backPageColor,
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      ),
                      initInput('备注', '填写内容和客服协商确认', _remarkController),
                    ],
                  ),
                ),
                AgreementPage()
              ],
            )),
        bottomSheet: new Container(
            height: 56.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                    flex: 0,
                    child: new Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 16.0),
                        child: new Text('首付金额:',
                            style: TextStyle(
                                color: GlobalColor.blackWordColor, fontSize: 12)))),
                new Expanded(
                  child: new Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 0.0),
                      child: new Text('${amountFirstPayable}',
                          style: TextStyle(
                              color: GlobalColor.baseColor, fontSize: 18))),
                  flex: 4,
                ),
                new Expanded(
                    flex: 6,
                    child: InkWell(
                      onTap: () {
                        // Application.router.navigateTo(context, '/payResult');
                        //_showDialog();
                        // showCupertinoDialog();
                        // 创建订单
                        createOrder();

                      },
                      child: new Container(
                        color: GlobalColor.baseColor,
                        alignment: Alignment.center,
                        child: new Text(
                          '下单并预授支付',
                          style: TextStyle(
                              color: GlobalColor.whiteWordColor,
                              fontSize: GlobalFont.fontSize16),
                        ),
                      ),
                    ))
              ],
            )),
      );
    });
  }

  Widget listItem(title, content) {
    return new Container(
        color: GlobalColor.whiteWordColor,
        margin: EdgeInsets.only(top: 10),
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: InkWell(
            onTap: () {
              _modalBottomSheetMenu();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new Container(
                      child: new Text(
                    title,
                    style:
                        TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
                  )),
                  flex: 10,
                ),
                new Expanded(
                  child: new Container(
                      margin: EdgeInsets.only(right: 5.0),
                      child: new Text(
                        content,
                        style: TextStyle(
                            color: GlobalColor.categoryDefaultColor,
                            height: 1.2),
                      )),
                  flex: 0,
                ),
                new Expanded(
                    flex: 0,
                    child: new Container(
                        margin: EdgeInsets.only(top: 2),
                        child: new Icon(
                          Icons.chevron_right,
                          color: GlobalColor.rightIconColor,
                          size: 20,
                        ))),
              ],
            )));
  }

  // 租赁的信息
  Widget productInfo(model) {
    return new Container(
      color: GlobalColor.whiteWordColor,
      padding: EdgeInsets.only(left: 16, right: 30, top: 16, bottom: 16),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: EdgeInsets.only(right: 15.0),
              child: new InkWell(
                onTap: null,
                child: new Image(
                    width: 70, height: 70, image: NetworkImage(model.skuImg)),
              )),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    width: ScreenUtil().setWidth(450),
                    child: new Text(
                      '${model.goodsDetail.name}',
                      style: TextStyle(fontSize: 14.0),
                    )),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(top: 20),
                    child: new Text(
                      '规格: ${model.detailNoId}',
                      style: TextStyle(
                          color: GlobalColor.color999,
                          fontSize: 12.0,
                          height: 1.1),
                    ),
                  ),
                  flex: 0,
                ),
                new Expanded(
                  child: new Container(
                    child: new Text(
                      '租金：￥${model.selectedStage?.stagePrice}/${model.selectedStage?.unit == 'DAY' ? '天' : '月'}',
                      style: TextStyle(
                          color: GlobalColor.color999, fontSize: 12.0),
                    ),
                  ),
                  flex: 0,
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
            child: new Text('x ${model.amount}'),
            flex: 0,
          )
        ],
      ),
    );
  }

  // 租期 (备注： 如果是售卖的商品是没有租期的)
  Widget rentTime(model) {
    return new Container(
        color: GlobalColor.whiteWordColor,
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                '租期',
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 1,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: new Text(
                    '自物流签收第二天开始计算',
                    style: TextStyle(
                        color: GlobalColor.color999,
                        fontSize: GlobalFont.fontSize12,
                        height: 1.3),
                  )),
              flex: 10,
            ),
            new Expanded(
                flex: 0,
                child: new Text(
                  '${model.selectedStage?.stageNumber}${model.selectedStage?.unit == 'DAY' ? '天' : '个月'}',
                  style: TextStyle(color: GlobalColor.categoryDefaultColor),
                )),
          ],
        ));
  }

  // 押金 没有押金则不展示，有押金则展示，京东渠道进入该页面时判断用户的信用，免押则展示 减免押金
  Widget deposit(model) {
    return new Container(
        color: GlobalColor.whiteWordColor,
        margin: EdgeInsets.only(top: 10),
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                '押金',
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 10,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: new Text(
                    '￥ ${model.orderConfirmData?.deposit}',
                    style: TextStyle(
                        color: GlobalColor.categoryDefaultColor, height: 1.2),
                  )),
              flex: 0,
            ),
            new Expanded(
                flex: 0,
                child: new Container(
                    margin: EdgeInsets.only(top: 2),
                    child: new ImageIcon(
                      new AssetImage('assets/images/order/explain.png'),
                      color: GlobalColor.rightIconColor,
                      size: 25,
                    ))),
          ],
        ));
  }

  // 分期详情
  Widget stagesDetail() {
    return new Container(
        color: GlobalColor.whiteWordColor,
//        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                '分期详情',
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 10,
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.only(right: 5.0, top: 5.0),
                      child: new Text(
                        '首期：￥50',
                        style: TextStyle(
                            color: GlobalColor.categoryDefaultColor,
                            height: 1.2),
                      )),
                  new Container(
                      margin: EdgeInsets.only(right: 5.0),
                      child: new Text(
                        '剩余：￥100*6期',
                        style:
                            TextStyle(color: GlobalColor.categoryDefaultColor),
                      ))
                ],
              ),
              flex: 0,
            ),
            new Expanded(
                flex: 0,
                child: new Container(
                    margin: EdgeInsets.only(top: 2),
                    child: new Icon(
                      Icons.chevron_right,
                      color: GlobalColor.rightIconColor,
                      size: 20,
                    ))),
          ],
        ));
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: ScreenUtil().setHeight(800.0),
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        });
  }

  _showDialog() async {
    var result = await showDialog(
      context: context,
      builder: (ctx) {
        // return new AlertDialog(
        //   title: new Text('标题'),
        //   content: new SingleChildScrollView(
        //     child: new ListBody(
        //       children: <Widget>[
        //         new Text('内容 1'),
        //         new Text('内容 2'),
        //       ],
        //     ),
        //   ),
        //   actions: <Widget>[
        //     new FlatButton(
        //       child: new Text('确定'),
        //       onPressed: () {
        //         print('关闭弹框');
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
        // );
        return new SimpleDialog(
          title: new Text('选择'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('选项 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    print("result = $result");
  }

  // 苹果风格的弹窗
  void showCupertinoDialog() {
    var dialog = CupertinoAlertDialog(
      content: Text(
        "你好,我是你苹果爸爸的界面",
        style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        CupertinoButton(
          child: Text("取消"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoButton(
          child: Text("确定"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
