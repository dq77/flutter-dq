import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_taozugong_app/common/resources.dart';
import 'package:flutter_taozugong_app/components/appBar/index.dart';
import 'package:flutter_taozugong_app/components/myButton/index.dart';
import 'package:flutter_taozugong_app/components/textField/index.dart';

import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';

import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';
import 'package:flutter_taozugong_app/common/local/local_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _isClick = false;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _nodeText1,
          closeWidget: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("关闭"),
          ),
        ),
        KeyboardAction(
          focusNode: _nodeText2,
          closeWidget: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("关闭"),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    String token;
    if(token != null){
       Application.router.navigateTo(context, "/home",
              transition: TransitionType.inFromBottom);
    }
    //监听输入改变
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    _nameController.text = FlutterStars.SpUtil.getString('phone');
  }

  void _verify() {
    String mobile = _nameController.text;
    String password = _passwordController.text;
    if (mobile.isEmpty || mobile.length < 11) {
      setState(() {
        _isClick = false;
      });
      return;
    }
    if (password.isEmpty || password.length < 6) {
      setState(() {
        _isClick = false;
      });
      return;
    }

    setState(() {
      _isClick = true;
    });
  }

  void _login() async {
    String mobile = _nameController.text;
    String password = _passwordController.text;
    FlutterStars.SpUtil.putString('phone', _nameController.text);

    if (_isClick) {
      try {
        var loginRes =
            await UserApiInterface.userLogin(mobile, password: password);
        /// print('loginRes22222 ${json.encode(loginRes['data']).toString()}');
        if (loginRes['code'] == 200) {
          Toast.show("登录成功", position: 'bottom');
          print('loginRes ${loginRes['data']['token'].toString()}');
          FlutterStars.SpUtil.putString('token',loginRes['data']['token']);
          Application.router.navigateTo(context, "/",
              transition: TransitionType.inFromBottom);
        } else {
          Toast.show("${loginRes['subMsg']}");
        }
      } catch (e) {
        Toast.show("登录失败", position: 'bottom');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          isBack: false,
          actionName: '验证码登录',
          onPressed: () {
            // AppNavigator.push(context, SMSLogin());
            Application.router.navigateTo(context, "/smsLogin",
                transition: TransitionType.inFromBottom);
          },
        ),
        body: defaultTargetPlatform == TargetPlatform.iOS
            ? FormKeyboardActions(
                child: _buildBody(),
              )
            : SingleChildScrollView(
                child: _buildBody(),
              ));
  }

  _buildBody() {
    return Container(
        // color: Colors.white,
        child: Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "密码登录",
            style: TextStyles.textBoldDark26,
          ),
          Gaps.vGap16,
          MyTextField(
            focusNode: _nodeText1,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入账号",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText2,
            config: _buildConfig(context),
            isInputPwd: true,
            controller: _passwordController,
            maxLength: 16,
            hintText: "请输入密码",
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            onPressed: _isClick ? _login : null,
            text: "登录",
          ),
          Container(
            height: 40.0,
            alignment: Alignment.centerRight,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Text(
                '忘记密码',
                style: TextStyles.textGray12,
              ),
              onTap: () {
                Application.router.navigateTo(context, "/resetPassword",
                    transition: TransitionType.inFromBottom);
              },
            ),
          ),
          Gaps.vGap16,
          Container(
              alignment: Alignment.center,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text(
                  '还没账号？快去注册',
                  style: TextStyle(color: Colours.text_blue),
                ),
                onTap: () {
                  Application.router.navigateTo(context, "/register",
                      transition: TransitionType.inFromBottom);
                },
              ))
        ],
      ),
    ));
  }
}
