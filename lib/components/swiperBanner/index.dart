import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/routers/application.dart';


/// 轮播组件
class SwiperBanner extends StatelessWidget{

  final List swiperDataList;
  final double height;
  SwiperBanner({Key key,this.swiperDataList,this.height}):super(key:key);

  @override
  Widget build(BuildContext context) {

    print('bannere接收到了数据 ${swiperDataList.length}');

    return Container(
//      padding: EdgeInsets.all(10.0),
      color:Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(this.height),
      child: swiperDataList.length > 0 ? Swiper(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              print('你当前点击了banner的位置');
              // Application.router.navigateTo(context,"/detail?id=${swiperDataList[index].content}");
            },
            child:  Image.network("${swiperDataList[index]['img']}",fit:BoxFit.fill),
          );
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ): null,
    );
  }
}
