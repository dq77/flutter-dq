//意见反馈

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/colors.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/common/styles.dart';
import 'package:flutter_taozugong_app/components/textField/index.dart';
import 'package:flutter_taozugong_app/pages/mine/feedback/selectPhoto.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

class FeedBackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FeedBackPageState();
}

class FeedBackPageState extends State<FeedBackPage> {
  BuildContext _context;
  TextEditingController _nameController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget contactInformation() {
    return new Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 15),
//      height: 80,
      color: GlobalColor.whiteWordColor,
      child: new Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "联系方式（选填）",
              style: TextStyle(
                  fontSize: GlobalFont.fontSize14, fontWeight: FontWeight.w700),
            ),
          ),
          Gaps.vGap4,
          TextField(
            controller: _nameController,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: GlobalColor.blackWordColor,
                fontSize: GlobalFont.fontSize12),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10, top: 3),
              hintText: '请输入手机号方便联系',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colours.app_main, width: 0.8)),
              hintStyle: TextStyle(
                  color: Colors.grey, fontSize: GlobalFont.fontSize12),
            ),
          ),
        ],
      ),
    );
  }

  Widget feedBack() {
    return new Container(
      decoration: BoxDecoration(
          color: GlobalColor.whiteWordColor,
          border: Border.all(color: GlobalColor.borderColor, width: 1)),
      padding: EdgeInsets.only(left:8,right: 8,top: 12,bottom: 12),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              '问题和意见',
              style: TextStyle(
                  fontSize: GlobalFont.fontSize14,
                  color: GlobalColor.blackWordColor,
                  fontWeight: FontWeight.w600),
            ),
            alignment: Alignment.centerLeft,
          ),
          TextFormField(
            controller: _nameController,
            maxLines: 10,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: GlobalColor.blackWordColor,
                fontSize: GlobalFont.fontSize12),
            maxLength: 500,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10, top: 3),
              hintText: '请描述你使用系统时的问题和建议',
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: Colors.grey, fontSize: GlobalFont.fontSize12),
            ),
          ),
          SelectFile(
              callback: (val) => getpRrove(val))
//          Row (
//            children: <Widget>[
//              Container(
//                width: 100,
//                height: 100,
//                child:
//                Image(image: AssetImage('assets/images/common/addPhoto.png')),
//              )
//            ],
//          ),
//          Container(
//            alignment: Alignment.centerLeft,
//            margin: EdgeInsets.only(top: 5,bottom: 15,left: 14),
//            child: Text('最多三张(选填)',style: TextStyle(
//              fontSize: GlobalFont.fontSize10
//            ),),
//          ),
        ],
      ),
    );
  }
  void getpRrove(val) {
    print(val);
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

                  },
                  child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      color: GlobalColor.buttonColor,
                      child: Text(
                        '提交',
                        style: TextStyle(
                            color: GlobalColor.whiteWordColor, fontSize: 16.0),
                      )))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    final double topPadding = MediaQuery.of(context).padding.top;
    print(topPadding);
    double height = MediaQuery.of(context).size.height;
    var warpHeight = MediaQuery.of(context).size.height - 90.0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: GlobalColor.blackWordColor),
        centerTitle: true,
        backgroundColor: GlobalColor.whiteWordColor,
        title: Text(
          '意见反馈',
          style: TextStyle(
              fontSize: GlobalFont.fontSize18,
              color: GlobalColor.blackWordColor,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: GlobalColor.whiteWordColor,
            padding: EdgeInsets.all(12),
            child: feedBack(),
          ),
          contactInformation(),
        ],
      ),
      bottomSheet: footer(),
    );
  }
}
