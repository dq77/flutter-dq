import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/service/user/index.dart';
import 'package:image_picker/image_picker.dart';

class SelectFile extends StatefulWidget {
  SelectFile({
    Key key,
    this.callback,
  }) : super(key: key);
  final callback;

  @override
  SelectFileState createState() => new SelectFileState();
}

class SelectFileState extends State<SelectFile> {
  BuildContext _context;
  bool feedAdd = false;
  bool feedFile = true;

  // 上传之后拿到的 （需要提交）
  List<String> feedUploadList = [];

  void initState() {
    super.initState();
  }

  _callCamera() {
    showModalBottomSheet(
        context: _context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text("拍照"),
                onTap: () {
                  getPhoto('camera');
                },
              ),
              new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text("我的相册"),
                onTap: () {
                  getPhoto('gallery');
                },
              ),
            ],
          );
        });
  }

  getPhoto(source) async {
    File file;
    source == 'gallery'
        ? file = await ImagePicker.pickImage(source: ImageSource.gallery)
        : file = await ImagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      uploadFile(file);
    }
    Navigator.pop(context);
  }

  Widget photoWarp(context, list) {
    return new Container(
      margin: EdgeInsets.only(top: 5),
      height: 90,
      padding: EdgeInsets.all(0),
      child: new ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: list.length,
          itemExtent: 120.0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return new ListTile(
              title: activeObj(context, list, index),
              //item的点击事件 跳转到新的页面并携带一个Todo对象 传参就是通过构造函数了
            );
          }),
    );
  }

  Widget initDel(index) {
    return Container(
      width: 16,
      child: new GestureDetector(
        onTap: () {
          setState(() {
            feedUploadList.removeAt(index);
            widget.callback(feedUploadList);
            feedAdd = false;
            if (feedUploadList.length == 0) {
              feedFile = true;
            }
          });
        },
        child: Image.asset('assets/images/user/del.png'),
      ),
    );
  }

  Widget activeObj(context, list, index) {
    return new Container(
        height: 470,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Stack(children: [
          new GestureDetector(
              onTap: () {

              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 5.0, top: 10),
                  height: 100,
                  width: 80,
                  child: new Image.network(HttpConfig.imagAddress + list[index],
                      fit: BoxFit.cover))),
          new Positioned(
            left: 72,
            top: 1,
            child: initDel(index),
          ),
        ]));
  }

  // 上傳圖片
  uploadFile(file) async {
    await UserApiInterface.uploadFile(file).then((result) {
      print(result['code']);
      if (result['code'] == 200) {
        setState(() {
          feedUploadList.insert(0, result['data']['imgRout']);
          if (feedUploadList.length < 3) {
            feedAdd = false;
          } else {
            feedAdd = true;
          }
          if (feedUploadList.length > 0) {
            feedFile = false;
          } else {
            feedFile = true;
          }
          print(feedUploadList);
          widget.callback(feedUploadList);
        });
      } else {
        print('上传失败');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return new Container(
        margin: EdgeInsets.only(top: 15),
        child: new Container(
            width: MediaQuery
                .of(context)
                .size
                .width - 40,
            decoration: new BoxDecoration(
              color: GlobalColor.whiteWordColor,
              borderRadius: BorderRadius.all(const Radius.circular(8.0)),
            ),
            child: new Column(
                children: <Widget>[
            new Offstage(
            offstage: feedFile,
                child: photoWarp(_context, feedUploadList)),
            new Offstage(
                offstage: feedAdd,
                child: new FlatButton(
                    onPressed: () {
                      _callCamera();
                    },
                    child: Row(
                      children: <Widget>[
                        new Container(
                            padding: EdgeInsets.all(0),
                            width: 76.0,
                            height: 100,
                            alignment: Alignment.centerLeft,
                            child: new Image.asset(
                              'assets/images/common/addPhoto.png',
                            ))
                      ],
                    ))),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only( bottom: 15, left: 22),
              child: Text('最多三张(选填)', style: TextStyle(
                  fontSize: GlobalFont.fontSize10
              ),),
            )
              ],
            )));
  }
}
