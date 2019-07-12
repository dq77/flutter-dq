import 'package:flutter/material.dart';
import 'router_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/pages/common/404.dart';
import 'package:flutter_taozugong_app/pages/common/webview_page.dart';

class Routes {
  static String root = '/';
  static String loginPage = '/login';
  static String registerPage = '/register';
  static String resetPasswordPage = '/resetPassword';
  static String updatePasswordPage = '/updatePassword';
  static String smsLoginPage = '/smsLogin';
  
  static String homePage = '/home';
  static String goodsDetailPage = '/goodsDetail';
  static String orderConfirmPage = '/orderConfirm';
  static String orderListPage = '/orderList';
  static String orderDetailPage = '/orderDetail';

  static String custom = '/customScrollViewTestRoute';
  static String address = '/addressManagement';
  static String addressInFoEdit = '/addressEdit';
  static String myCouponPage = '/myCoupon';
  static String commonProblemPage = '/commonProblem';
  static String feedBackPage = '/feedBack';

  static String webViewPage = '/webview';

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>> params){
        print('ERROR ===> ROUTE WAS NOT FOUND!!!');
        return WidgetNotFound();
      }
    );

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    router.define(root, handler: indexHandler);
    router.define(homePage, handler: homeHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(smsLoginPage, handler: smsLoginHandler);
    router.define(registerPage, handler: registerHandler);
    router.define(resetPasswordPage, handler: resetPasswordHandler);
    router.define(updatePasswordPage, handler: updatePasswordHandler);

  
    router.define(goodsDetailPage, handler: goodsDetailHandler);
    router.define(orderConfirmPage, handler: orderConfirmHandler);

    router.define(orderConfirmPage, handler: orderConfirmHandler);
    router.define(orderListPage, handler: orderListHandler);
    router.define(orderDetailPage, handler: orderDetailHandler);

    router.define(custom, handler: customHandler);
    router.define(address, handler: addressHandler);
    router.define(addressInFoEdit, handler: addressInFoEditHandler);
    router.define(myCouponPage, handler: myCouponPageHandler);
    router.define(commonProblemPage, handler: commonProblemHandler);
    router.define(feedBackPage, handler: feedBackHandler);


  }

}