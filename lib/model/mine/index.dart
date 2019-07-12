import 'package:scoped_model/scoped_model.dart';

class MineModel extends Model{

  Object _userInfo = {};
  get userInfo => _userInfo;

  /// 获取用户信息
  void getUserInfo(){

    print('测试状态管理 Scoped_model');


    // 将变化推送给监听者
    notifyListeners();
  }



  MineModel of(context) => ScopedModel.of<MineModel>(context);
}