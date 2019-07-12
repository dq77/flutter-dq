import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';

class CommonProblem extends StatefulWidget {
  CommonProblem({Key key}) : super(key: key);

  _CommonProblemState createState() => _CommonProblemState();
}

class _CommonProblemState extends State<CommonProblem> {
  List problem = [
    {
      'title': '1.关于租赁(到期归还、续租、买断等)',
      'children': [
        '* 租期计算：自您收到货第二天开始计租期，并且租期按自然月进行计算，如3月4日开始，一个月租期则截止到4月3日。',
        '* 归还：到期后会有客服联系您进行归还，您也可主动联系客服预约物流归还商品；如您需要提前归还将会产生违约金，请联系客服确认退货事宜。',
        '* 续租：如果您在租赁期内或者租赁到期时想要续租商品，您可在订单详情页自行续租下单。',
        '* 买断：如果您在租赁期内或者租赁到期时想要买断商品，请联系客服了解买断价格等事宜，届时将会在订单详情页开放买断入口，您自行下单购买即可。'
      ]
    },
    {
      'title': '2.关于押金',
      'children': [
        '* 押金：租赁商品物权归属淘租公，防止用户恶意损害商品，需要先收取押金作为担保。',
        '* 信用免押：根据您的信用将会进行押金减免，最高可全部减免。',
        '* 押金解冻：订单完结时，剩余押金系统将会自动解冻/退回。'
      ]
    },
    {
      'title': '3.关于京东分期代扣',
      'children': [
        '* 签约：下单支付时需要您先签约免密代扣，同意淘租公进行分期款项的代扣。如果您已签约，在后期下单时可不用再签。',
        '* 分期代扣：在已签约的基础上，系统将在账期日自动扣除每期应付款。'
      ]
    },
    {
      'title': '4.关于退换货、维修等售后',
      'children': [
        '* 退换货：退换货申请请联系客服。因商品质量或错发漏发导致的退换货由淘租公承担运费，因您个人原因问题导致的退换货将由您承担退回运费，如果已经使用中将会收取一定的违约金',
        '* 维修保养：因非人为损坏造成的商品故障，寄回或者上门维修的所有费用由淘租公承担；因人为损坏产生的维修费用和物流费用需由您支付。一切商品使用期间产生的保养类服务费用（如更换滤网、滤芯等服务）由您承担。'
      ]
    },
    {
      'title': '5.关于逾期支付、逾期归还',
      'children': [
        '* 分期代扣时，因您账户余额不足等问题导致的，将会产生支付逾期费用，同时也会影响您的相关征信，当您产生逾期时请尽快咨询客服。',
        '* 到期归还时，因您的原因导致没有及时归还的，将会产生归还逾期费用，同时也会影响您的相关征信，当您产生逾期时请尽快咨询客服。'
      ]
    },
    {'title': '联系我们', 'children': []}
  ];

  Widget accordion(index, item) {
    print(index);
    List<Widget> list = [];
    for (int i = 0; i < item['children'].length; i++) {
      list.add(accordionChild(i, item['children']));
    }
    return item['children'].length > 0
        ? new Container(
//            color: GlobalColor.whiteWordColor,
            decoration: new BoxDecoration(
                color: GlobalColor.whiteWordColor,
                border: Border(
                  bottom: false
                      ? BorderSide(color: GlobalColor.divideColor, width: 1)
                      : BorderSide(color: GlobalColor.divideColor, width: 0),
                )),
            child: ExpansionTile(
                title: Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Text(item['title']),
                ),
                children: list),
          )
        : connectUs();
  }

  Widget accordionChild(index, item) {
    return new Container(
      padding: EdgeInsets.only(top: 18, bottom: 18, left: 16.0, right: 16.0),
//      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: new BoxDecoration(
          color: GlobalColor.whiteWordColor,
          border: Border(
            top: index == 0
                ? BorderSide(color: GlobalColor.divideColor, width: 1)
                : BorderSide(color: GlobalColor.divideColor, width: 0),
            bottom: index + 1 != item.length
                ? BorderSide(color: GlobalColor.divideColor, width: 1)
                : BorderSide(color: GlobalColor.divideColor, width: 0),
          )),
      child: Text(item[index]),
    );
  }

  // 联系我们
  Widget connectUs() {
    return new Container(
      color: GlobalColor.whiteWordColor,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: new Text(
              '联系我们',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  '拨打客服电话：',
                  style: TextStyle(fontSize: GlobalFont.fontSize12),
                ),
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Utils.launchTelURL('0571-85180735');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5, top: 2),
                      child: Text(
                        '0571-85180735',
                        style: TextStyle(
                            fontSize: GlobalFont.fontSize12,
                            color: Color(0XFF008cff)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Utils.launchTelURL('0571-87676760');
                    },
                    child: Container(
                      child: Text(
                        '0571-87676760',
                        style: TextStyle(
                            fontSize: GlobalFont.fontSize12,
                            color: Color(0XFF008cff)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          new Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: new Text(
              '客服服务时间: 9:00-18:00',
              style: TextStyle(
                fontSize: GlobalFont.fontSize12,
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: new Text(
              '官方微信： 微信公众号搜索"淘租公服务"',
              style: TextStyle(
                fontSize: GlobalFont.fontSize12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print('返回上一页');
            Navigator.pop(context);
          },
        ),
        title: const Text('常见问题', style: TextStyle(color: Colors.black)),
      ),
      body: ListView.builder(
          itemCount: problem.length,
          itemBuilder: (context, index) {
            final item = problem[index];
            return accordion(index, item);
          }),
    ));
  }
}
