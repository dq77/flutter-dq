// 地址信息新增编辑

import 'package:city_pickers/meta/province.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter_taozugong_app/components/cityPicker/picker.dart';

import 'package:flutter_taozugong_app/utils/toast.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/model/global.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

import 'package:flutter_taozugong_app/model/user/entity.dart';

class AddressInFoEdit extends StatefulWidget {
  final String type;
  final String id;
  AddressInFoEdit({Key key, this.type, this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new AddressInFoEditState();
}

class AddressInFoEditState extends State<AddressInFoEdit> {
  
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  FocusNode nodeTwo = FocusNode();

  BuildContext _context;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();

  
  String area = '请选择所在地区';
  PickerItem showTypeAttr = PickerItem(name: '省+市+县', value: ShowType.pca);
  Result resultAttr = new Result();
  Result result = new Result();
  double barrierOpacityAttr = 0.5;
  bool barrierDismissibleAttr = true;
  bool customerMeta = false;

  AddressInfoData addressInfo;

  String addressArea; // 区、县
  String addressAreaCode; // 区、县
  String addressCity; // 市
  String addressCityCode; // 市
  String addressProvince; // 省
  String addressProvinceCode;

  bool isDefault = false;

  @override
  void initState() {
    super.initState();

    print('当前页面的类型 ${widget.type}');
    print('当前页面的id ${widget.id}');
    if(widget.type == 'add'){
      print('当前是添加地址页面需要清空数据');
    } else {
      print('当前是修改地址页面需要赋值数据');
      _getAddressInfo(widget.id);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _addressController.dispose();
    nodeTwo.dispose();
    super.dispose();
  }

  //  获取用户信息
  getUserInfo() {}

  // 获取需要修改的地址信息
  void _getAddressInfo(id) async {
    print('获取修改地址信息');
    final globalModel = GlobalModel().of(context);
    await globalModel.getAddressInfo(id);

    print('当前要修改的 ${globalModel.addressInfo.toString()}');

    this.setState(() {
      addressInfo = globalModel.addressInfo;
      _nameController.text = addressInfo.receiveName;
      _phoneController.text =addressInfo.mobile;
      _addressController.text =addressInfo.detail;
      area ='${addressInfo.province}${addressInfo.city}${addressInfo.area}';
      addressProvinceCode = addressInfo.provinceCode;
      addressCityCode = addressInfo.cityCode;
      addressAreaCode = addressInfo.areaCode;
      isDefault = addressInfo.isDefault == 1 ? true:false;
    });
    
  }

  // 修改地址
  void _modify() async {
    print('修改地址');
  }

  // 重置数据
  void _reset() async{
    this.setState((){
      _nameController.text = '';
      _phoneController.text ='';
      _addressController.text ='';
      area ='请选择所在地区';
      result=null;
      addressProvince=null;
      addressProvinceCode=null;
      addressCity=null;
      addressCityCode=null;
      addressArea=null;
      addressAreaCode=null;
    });
  }

  void _save() async {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String detail = _addressController.text;

    print('你调用了保存的方法 ${result?.provinceName.toString()}');
    print('你调用了保存的方法 ${name}');
    print('你调用了保存的方法 ${phone}');
    print('调用类型 ${widget.type}');
    print('调用类型 ${widget.type == "add"}');
    print('调用类型 ${widget.type == "'edit'"}');
    
    if(name.isEmpty) {
      Toast.show('请输入收货人姓名'); 
      return;
    } 
    if(phone.isEmpty || phone.length < 11) {
      Toast.show('请输入正确手机号');
      return;
    }
    // if(result?.provinceName == null){
    //   Toast.show('请选择省市区地址');
    //   return;
    // }

    if(area == '请选择所在地区'){
      Toast.show('请选择省市区地址');
      return;
    }
    if(detail.isEmpty){
      Toast.show('请填写详细地址');
      return;
    }

    final globalModel = GlobalModel().of(context);

    if(widget.type == 'add'){
      print('添加地址了');
      await globalModel.addAddress(
        addressProvince,
        addressProvinceCode,
        addressCity,
        addressCityCode,
        addressArea,
        addressAreaCode,
        detail,
        phone,
        name,
        isDefault ? 1:0
      );
    } else if(widget.type == 'edit') {

      print('修改地址了');
      await globalModel.modifyAddress(
        int.parse(widget.id),
        addressProvince,
        addressProvinceCode,
        addressCity,
        addressCityCode,
        addressArea,
        addressAreaCode,
        detail,
        phone,
        name,
        isDefault ? 1:0
      );
    }

    
    Application.router.pop(context);
    //Application.router.navigateTo(context, "/login",transition: TransitionType.inFromBottom);
  
  }

  // 选择所在地区
  Widget selectAddress(text, holder) {
    return new Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
        color: GlobalColor.whiteWordColor,
        border: Border(
          bottom: BorderSide(color: GlobalColor.divideColor, width: 1),
        ),
      ),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(text,
                    style: TextStyle(fontSize: GlobalFont.fontSize12))),
            flex: 2,
          ),
          new Expanded(
            flex: 6,
            child: new FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  print("locationCode $resultAttr");
                  Result tempResult = await CityPickers.showCityPicker(
                      context: context,
                      theme: ThemeData.fallback(),
                      locationCode: resultAttr != null
                          ? resultAttr.areaId ??
                              resultAttr.cityId ??
                              resultAttr.provinceId
                          : null,
                      showType: showTypeAttr.value,
                      barrierOpacity: barrierOpacityAttr,
                      barrierDismissible: barrierDismissibleAttr,
                      citiesData: customerMeta == true ? citiesData : null,
                      provincesData:
                          customerMeta == true ? provincesData : null);
                  
                  print('省市区 ${tempResult.toString()}');

                  if (tempResult == null) {
                    return;
                  }
                  this.setState(() {
                    result = tempResult;
                    print(result.provinceName);
                    area = result.provinceName + result.cityName + result.areaName;
                    addressProvince = result.provinceName;
                    addressProvinceCode = result.provinceId;
                    addressCity = result.cityName;
                    addressCityCode = result.cityId;
                    addressArea = result.areaName;
                    addressAreaCode = result.areaId;
                  });
                },
                child: new Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      holder,
                      style: TextStyle(
                          color: Colors.grey, fontSize: GlobalFont.fontSize12),
                    ))),
          ),
        ],
      ),
    );
  }

  // 文本输入框
  Widget initInput(title, controller, hinTxt, type) {
    return new Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
        color: GlobalColor.whiteWordColor,
        border: Border(
          bottom: BorderSide(color: GlobalColor.divideColor, width: 1),
        ),
      ),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                title,
                style: TextStyle(fontSize: GlobalFont.fontSize12),
              ),
            ),
            flex: 3,
          ),
          new Expanded(
            flex: 9,
            child: Container(
//                alignment: Alignment.centerRight,
                child: new TextField(
              controller: controller,
              cursorColor: Color(0xFFc3c3c5),
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.grey, fontSize: GlobalFont.fontSize12),
              keyboardType:
                  type == 'text' ? TextInputType.text : TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hinTxt,
                hintStyle: TextStyle(
                    color: Colors.grey, fontSize: GlobalFont.fontSize12),
              ),
            )),
          ),
        ],
      ),
    );
  }

  // 默认收货地址
  Widget initDefault() {
    return new GestureDetector(
        onTap: () {
          setState(() {
            isDefault = !isDefault;
          });
        },
        child: new Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
          color: GlobalColor.whiteWordColor,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new GestureDetector(
                  onTap: () {
                    setState(() {
                      isDefault = !isDefault;
                    });
                  },
                  child: isDefault
                      ? new Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: Icon(
                            Icons.check,
                            size: 15.0,
                            color: Colors.white,
                          ))
                      : new Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: GlobalColor.rightIconColor),
                              shape: BoxShape.circle,
                              color: Colors.white),
                        )),
              new Container(
                child: new Text(
                  '设为默认地址',
                  style: TextStyle(fontSize: GlobalFont.fontSize12),
                ),
              ),
            ],
          ),
        ));
  }

  Widget footer() {
    return new Container(
      height: 56.0,
      child: new Row(
        children: <Widget>[
          new Expanded(
              flex: 12,
              child: new GestureDetector(
                  onTap: () {
                    print('你点击了保存地址');
                    _save();
//                    Application.router.navigateTo(context,"/addressEdit",transition: TransitionType.inFromBottom);
                  },
                  child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      color: GlobalColor.buttonColor,
                      child: new Text(
                        '保存地址',
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

    return new Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        iconTheme:IconThemeData(
            color: GlobalColor.blackWordColor
        ),
        centerTitle: true,
        backgroundColor: GlobalColor.whiteWordColor,        title: Text(
        '新增地址',
        style: TextStyle(
            fontSize: GlobalFont.fontSize18,
            color: GlobalColor.blackWordColor,
            fontWeight: FontWeight.w600),
      ),
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical: 12.0),
        child: ListView(
          children: <Widget>[
            initInput('收货人姓名', _nameController, '收货人姓名（请使用真实姓名）', 'text'),
            initInput('客户手机', _phoneController, '请填写手机号码', 'num'),
            selectAddress('所在地区', area),
            initInput('详细地址', _addressController, '请补充详情收货地址、如街道、门牌号', 'text'),
            SizedBox(height: 8.0),
            initDefault(),
          ],
        ),
      ),
      bottomSheet: footer(),
    );
  }
}
