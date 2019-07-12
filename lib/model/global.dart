import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/home/index.dart';
import 'package:flutter_taozugong_app/model/goods/index.dart';
import 'package:flutter_taozugong_app/model/user/index.dart';
import 'package:flutter_taozugong_app/model/order/index.dart';
import 'package:flutter_taozugong_app/model/category/index.dart';

class GlobalModel extends Model
    with UserModel, HomeModel, CategoryModel, GoodsModel, OrderModel {
  int _count = 0;
  int _currentIndex = 1;

  get count => _count;
  get currentIndex => _currentIndex;

  void increment() {
    _count++;
    notifyListeners();
  }

  //  改变索引
  changeIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  // 重写of方法
  GlobalModel of(context) => ScopedModel.of<GlobalModel>(context);
}
