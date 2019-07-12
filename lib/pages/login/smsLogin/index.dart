
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/pages/login/register/index.dart';
import 'package:flutter_taozugong_app/pages/login/resetPassword/index.dart';
import 'package:flutter_taozugong_app/common/resources.dart';
import 'package:flutter_taozugong_app/components/appBar/index.dart';
import 'package:flutter_taozugong_app/components/myButton/index.dart';
import 'package:flutter_taozugong_app/components/textField/index.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:flutter_taozugong_app/common/local/local_storage.dart';


class SMSLogin extends StatefulWidget {
  @override
  _SMSLoginState createState() => _SMSLoginState();
}

class _SMSLoginState extends State<SMSLogin> {
  
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  bool _isClick = false;
  bool _isGetCodeClick = false;
  
  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_verify);
    _vCodeController.addListener(_verify);
     _phoneController.text = FlutterStars.SpUtil.getString('phone');
  }

  void _verify(){
    String name = _phoneController.text;
    String vCode = _vCodeController.text;
    if (name.isEmpty || name.length < 11) {
      setState(() {
        _isClick = false;
      });
      return;
    }
    setState(() {
      _isGetCodeClick = true;
    });
    if (vCode.isEmpty || vCode.length < 4) {
      setState(() {
        _isClick = false;
      });
      return;
    }

    setState(() {
      _isClick = true;
    });
  }

  void _login() async{
    print('点击登录');
    String mobile = _phoneController.text;
    String vCode = _vCodeController.text;
    FlutterStars.SpUtil.putString('phone', _phoneController.text);

    if (_isClick) {
      try {
        var loginRes =
            await UserApiInterface.userLogin(mobile, verification: vCode);
        if (loginRes['code'] == 200) {
          Toast.show("登录成功", position: 'bottom');
          print('loginRes ${loginRes['data']['token'].toString()}');
          LocalStorage.save('token', loginRes['data']['token']);
          Application.router.navigateTo(context, "/home",
              transition: TransitionType.inFromBottom);
        } else {
          Toast.show("${loginRes['subMsg']}");
        }
      } catch (e) {
        Toast.show("登录失败", position: 'bottom');
      }
    }
  }

  void _getAuthCode(bool isTag) async{
    String mobile = _phoneController.text;
    
    if(_isGetCodeClick){
      var authCodeRes = await UserApiInterface.userGetAuthCode(mobile, 'Login');
        
      print('authCodeRes ${authCodeRes['code']}');
      if(authCodeRes['code'] == 200){
        Toast.show("验证码发送成功！");
      } else {
        Toast.show("${authCodeRes['subMsg']}");
      }

    } else {
      Toast.show("请输入手机号码！");
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "验证码登录",
              style: TextStyles.textBoldDark26,
            ),
            Gaps.vGap16,
            MyTextField(
              controller: _phoneController,
              maxLength: 11,
              keyboardType: TextInputType.phone,
              hintText: "请输入账号",
            ),
            Gaps.vGap10,
            MyTextField(
              controller: _vCodeController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              hintText: "请输入验证码",
              getVCode: (){
                _getAuthCode(_isClick);
                Toast.show('获取验证码',position:'bottom');
              },
            ),
            Gaps.vGap10,
            Container(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                      text: '提示：未注册账号的手机号，请先',
                      style: TextStyles.textGray14,
                      children: <TextSpan>[
                        TextSpan(text: '注册', style: TextStyle(color: Colours.text_red)),
                        TextSpan(text: '。'),
                      ],
                    ),
                  ),
                  onTap: (){
                    // AppNavigator.push(context, Register());

                    Application.router.navigateTo(context,"/register",transition: TransitionType.inFromBottom);
                    
                  },
                )
            ),
            Gaps.vGap15,
            Gaps.vGap10,
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
                onTap: (){
                  // AppNavigator.push(context, ResetPassword());

                  Application.router.navigateTo(context,"/resetPassword",transition: TransitionType.inFromBottom);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
