import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'util/global.conf.dart';
import 'package:dio/dio.dart';
import 'util/Storage.dart';
import 'package:json_serializable/json_serializable.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      //   print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      //   print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      //   print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  /**
   * 验证用户名
   */
  String validateUserName(value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  /**
   * 验证密码
   */
  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334));

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              maxLength: 11,
              maxLengthEnforced: true,
              cursorWidth: 1.0,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                counterText: "", //隐藏文字统计
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                //尾部添加清除按钮
                suffixIcon: (_isShowClear)
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // 清空输入框内容
                          _userNameController.clear();
                        },
                      )
                    : null,
              ),
              // //验证用户名
              validator: validateUserName,
              //保存数据
              onSaved: (String value) {
                print(_username);
                _username = value;
              },
            ),
            TextFormField(
              focusNode: _focusNodePassWord,
              style: TextStyle(color: Colors.white),
              maxLength: 18,
              cursorWidth: 1.0,
              initialValue: "123456",
              maxLengthEnforced: true,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: "请输入密码",
                  counterText: "",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  // 是否显示密码
                  suffixIcon: IconButton(
                    color: Colors.white,
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )),
              obscureText: !_isShowPwd,
              // //密码验证
              validator: validatePassWord,
              //保存数据
              onSaved: (String value) {
                _password = value;
              },
            )
          ],
        ),
      ),
    );

    // 登录按钮区域
    Widget loginButtonArea = new Container(
      width: 630.w,
      height: 90.h,
      child: new RaisedButton(
        color: Color.fromRGBO(26, 193, 166, 1),
        child: Text(
          "登录",
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: () async {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodeUserName.unfocus();
          _focusNodePassWord.unfocus();

          if (_formKey.currentState.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState.save();
            //todo 登录操作
            print("$_username + $_password");
            Dio dio = Dio();
            try {
                Response response = await dio.post(Global.baseUrl + "/core/login", data: {
                    "mobile": _username,
                    "password": _password,
                });
                var data = json.decode(response.data.toString());
                print(data);
            } catch (e) {
                print(e);
            }

            //Global.baseUrl
          }
        },
      ),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
            child: new GestureDetector(
              onTap: () {
                // 点击空白区域，回收键盘
                print("点击了空白区域");
                _focusNodePassWord.unfocus();
                _focusNodeUserName.unfocus();
              },
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 188.h,
                  ),
                  Image.asset(
                    "images/login_logo.png",
                    width: 218.w,
                    height: 218.h,
                  ),
                  inputTextArea,
                  SizedBox(
                    height: ScreenUtil().setHeight(188),
                  ),
                  loginButtonArea
                ],
              ),
            )));
  }
}
