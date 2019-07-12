
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/resources.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';
import 'package:flutter_taozugong_app/components/appBar/index.dart';
import 'package:flutter_taozugong_app/components/myButton/index.dart';

class PayResult extends StatefulWidget {
  @override
  _PayResultState createState() => _PayResultState();
}

class _PayResultState extends State<PayResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "支付结果",
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Gaps.vGap50,
              Image.asset(
                Utils.getImgPath("store/icon_success"),
                width: 80.0,
                height: 80.0,
              ),
              Gaps.vGap12,
              Text(
                "支付成功",
                style: TextStyles.textDark16,
              ),
              Gaps.vGap8,
              Text(
                "2019-02-21 15:20:10",
                style: TextStyles.textGray12,
              ),
              Gaps.vGap8,
              Text(
                "预计发货时间：02月28日",
                style: TextStyles.textGray12,
              ),
              Gaps.vGap12,
              Gaps.vGap12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('回到首页'),
                    color: Colours.app_main,
                    textColor: Colors.white,
                    onPressed: (){
                      Application.router.navigateTo(context, "/home");
                    },
                  ),
                  SizedBox(width: 20.0,),
                  FlatButton(
                    child: Text('查看订单'),
                    color: Colours.app_main,
                    textColor: Colors.white,
                    onPressed: (){
                      Application.router.navigateTo(context, "/orderList");    
                    },
                  )
                ],
              ),
              // MyButton(
              //   onPressed: (){
              //     // NavigatorUtils.push(context, Routes.home, clearStack: true);
              //     Application.router.navigateTo(context, "/orderList");
              //   },
              //   text: "查看订单",
              // )
            ],
          ),
        ),
      ),
    );
  }
}
