
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';
import 'package:flutter_taozugong_app/common/resources.dart';
import 'package:flutter_taozugong_app/components/appBar/index.dart';
import 'package:flutter_taozugong_app/components/textField/index.dart';
import 'package:flutter_taozugong_app/components/myButton/index.dart';
import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isGetCodeClick = false;
  bool _isClick = false;
  
  @override
  void initState() {
    super.initState();
    //监听输入改变  
    _nameController.addListener(_verify);
    _vCodeController.addListener(_verify);
    _passwordController.addListener(_verify);
  }
  
  void _verify(){
    String mobile = _nameController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;
    if (mobile.isEmpty || mobile.length < 11) {
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
    if (password.isEmpty || password.length < 6) {
      setState(() {
        _isClick = false;
      });
      return;
    }

    print('1221212');

    setState(() {
      _isClick = true;
    });
  }
  
  void _login() async{
    String mobile = _nameController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;

    Toast.show("确认......");
    if(_isGetCodeClick){
      var registerRes = await UserApiInterface.userRegister(mobile, password, vCode);
      print('registerRes ${registerRes.toString()}');
      if(registerRes['code'] == 200){
        Toast.show("注册成功");
        Application.router.navigateTo(context, "/login",transition: TransitionType.inFromBottom);
      } else {
        Toast.show("${registerRes['subMsg']}");
      }

    }
  }


  void _getAuthCode(bool isTag) async{
    String mobile = _nameController.text;
    
    if(_isGetCodeClick){
      var authCodeRes = await UserApiInterface.userGetAuthCode(mobile, 'Register');
        
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
      appBar: MyAppBar(
        title: "注册",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "开启你的小公公账号",
              style: TextStyles.textBoldDark26,
            ),
            Gaps.vGap16,
            SizedBox(height: 16.0,),
            MyTextField(
              controller: _nameController,
              maxLength: 11,
              keyboardType: TextInputType.phone,
              hintText: "请输入手机号",
            ),
            Gaps.vGap10,
            SizedBox(height: 10.0,),
            MyTextField(
              controller: _vCodeController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              hintText: "请输入验证码",
              getVCode: (){
                _getAuthCode(_isClick);
              },
            ),
            Gaps.vGap10,
            SizedBox(height: 10.0,),
            MyTextField(
              isInputPwd: true,
              controller: _passwordController,
              maxLength: 16,
              hintText: "请输入密码",
            ),
            Gaps.vGap10,
            Gaps.vGap15,
            MyButton(
              onPressed: _isClick ? _login : null,
              text: "确认注册",
            )
          ],
        ),
      ),
    );
  }
}
