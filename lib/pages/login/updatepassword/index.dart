import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/resources.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';
import 'package:flutter_taozugong_app/components/appBar/index.dart';
import 'package:flutter_taozugong_app/components/myButton/index.dart';
import 'package:flutter_taozugong_app/components/textField/index.dart';
import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/routers/application.dart';


class UpdatePasswordPage extends StatefulWidget {
  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  //定义一个controller
  TextEditingController _oldPwdController = TextEditingController();
  TextEditingController _newPwdController = TextEditingController();
  bool _isClick = false;
  bool _isGetCodeClick = false;
  
  @override
  void initState() {
    super.initState();
    //监听输入改变  
    _oldPwdController.addListener(_verify);
    _newPwdController.addListener(_verify);
  }
  
  void _verify(){
    String oldPwd = _oldPwdController.text;
    String newPwd = _newPwdController.text;
    if (oldPwd.isEmpty || oldPwd.length < 6) {
      setState(() {
        _isClick = false;
      });
      return;
    }
     setState(() {
      _isGetCodeClick = true;
    });
    if (newPwd.isEmpty || newPwd.length < 4) {
      setState(() {
        _isClick = false;
      });
      return;
    }

    setState(() {
      _isClick = true;
    });
  }
  
  void _confirm(){
    Toast.show("修改成功！");
    Navigator.pop(context);
  }

  // void _login() async {
  //   Toast.show("确认......");
  //   String mobile = _nameController.text;
  //   String vCode = _vCodeController.text;
  //   String password = _passwordController.text;

  //   Toast.show("确认......");
  //   if (_isGetCodeClick) {
  //     var registerRes =
  //         await UserApiInterface.findPassword(mobile, password, vCode);
  //     print('registerRes ${registerRes.toString()}');
  //     if (registerRes['code'] == 200) {
  //       Toast.show("密码重置成功！", position: 'bottom');
  //       Application.router.navigateTo(context, "/login",
  //           transition: TransitionType.inFromBottom);
  //     } else {
  //       Toast.show("${registerRes['subMsg']}");
  //     }
  //   }
  // }

  // void _getAuthCode(bool isTag) async {
  //   String mobile = _nameController.text;

  //   if (_isGetCodeClick) {
  //     var authCodeRes =
  //         await UserApiInterface.userGetAuthCode(mobile, 'EditPwd');

  //     print('authCodeRes ${authCodeRes['code']}');
  //     if (authCodeRes['code'] == 200) {
  //       Toast.show("验证码发送成功！", position: 'bottom');
  //     } else {
  //       Toast.show("${authCodeRes['subMsg']}");
  //     }
  //   } else {
  //     Toast.show("请输入手机号码！", position: 'bottom');
  //     return;
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "修改密码",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "重置登录密码",
              style: TextStyles.textBoldDark26,
            ),
            Gaps.vGap8,
            Text(
              "设置账号 15000000000",
              style: TextStyles.textGray14,
            ),
            Gaps.vGap16,
            Gaps.vGap16,
            MyTextField(
              isInputPwd: true,
              controller: _oldPwdController,
              maxLength: 16,
              hintText: "请确认旧密码",
            ),
            Gaps.vGap10,
            MyTextField(
              isInputPwd: true,
              controller: _newPwdController,
              maxLength: 16,
              hintText: "请输入新密码",
            ),
            Gaps.vGap10,
            Gaps.vGap15,
            MyButton(
              onPressed: _isClick ? _confirm : null,
              text: "确认",
            )
          ],
        ),
      ),
    );
  }
}
