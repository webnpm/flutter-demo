import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
	@override
	_LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
	TextEditingController _userNameController = TextEditingController(text: '15927112332');
	TextEditingController _passwordController = TextEditingController(text: '123456');
	

	
	bool _btnHover = false;

	// @override
	// void initState() {
	// 	super.initState();

	// 	setState(() {
			
	// 	});
	// }

	@override
	Widget build(BuildContext context) {
		ScreenUtil.init(context, designSize: Size(750, 1334));
		return Scaffold(
			resizeToAvoidBottomInset:false,
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/app");
                },
            ),
			body: GestureDetector(
				onTap: () {
					FocusScope.of(context).requestFocus(FocusNode());
				},
				child:Container(
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage("images/bg.png"), fit: BoxFit.fill,alignment:Alignment.topCenter,)
					),
				  	child: Column(
				  		children: [
							SizedBox(
								height: 188.w,
							),
							Image.asset(
								"images/login_logo.png",
								width: 218.w,
								height: 218.w,
							),
							SizedBox(
								height: 94.w,
							),
							Container(
								padding: EdgeInsets.only(left: 50.w, right: 50.w),
								child: TextField(
									controller: _userNameController,
									keyboardType: TextInputType.phone,
									maxLength: 11,
									style: TextStyle(
										color: Colors.white
									),
									decoration: InputDecoration(
										counterText: "",
										hintText: "请输入手机号码",
										hintStyle: TextStyle(
											color: Color.fromRGBO(255, 255, 255, 0.5)
										),
										prefixIcon: Icon(Icons.people,size: 42.w,color: Colors.white,),
										enabledBorder: UnderlineInputBorder(      
											borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.5)),   
										),  
										focusedBorder: UnderlineInputBorder(
											borderSide: BorderSide(color: Colors.white),
										),
									),
								),
							),
							SizedBox(
								height: 20.w,
							),
							Container(
								padding: EdgeInsets.only(left: 50.w, right: 50.w),
								child: TextField(
									controller: _passwordController,
									keyboardType: TextInputType.text,
									maxLength: 11,
									obscureText:true,
									style: TextStyle(
										color: Colors.white
									),
									decoration: InputDecoration(
										counterText: "",
										hintText: "请输入密码",
										hintStyle: TextStyle(
											color: Color.fromRGBO(255, 255, 255, 0.5)
										),
										prefixIcon: Icon(Icons.lock,size: 42.w,color: Colors.white,),
										enabledBorder: UnderlineInputBorder(      
											borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.5)),   
										),  
										focusedBorder: UnderlineInputBorder(
											borderSide: BorderSide(color: Colors.white),
										),
									),
								),
							),
							Padding(
								padding: EdgeInsets.fromLTRB(50.w, 20.w, 50.w, 20.w),
								child: Align(
									alignment:Alignment.topRight,
									child: Text("忘记密码?",style: TextStyle(color: Color.fromRGBO(26, 194, 166, 1)),),
								),
							),
							SizedBox(
								height: 50.w,
							),
							GestureDetector(
								onTap: () {
									setState(() {
										_btnHover = true;
									});

									Future.delayed(Duration(milliseconds: 300), () {
										setState(() {
											_btnHover = false;
										});
									});
									Toast.show("您的账户${_userNameController.text} + 密码是${_passwordController.text}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
									// print("${_userNameController.text} + ${_passwordController.text}");
									// Scaffold.of(context).showSnackBar(SnackBar(
									// 	backgroundColor:Colors.red,
									// 	content: Text("您的账户${_userNameController.text} + 密码是${_passwordController.text}",style: TextStyle(color: Colors.white),),
									// ));
								},
								child:Container(
									width: 630.w,
									height: 90.w,
									alignment: Alignment.center,
									decoration: BoxDecoration(
										color: _btnHover?Color.fromRGBO(26, 194, 166, 0.5):Color.fromRGBO(26, 194, 166, 1),
										borderRadius:BorderRadius.circular(8),
									),
									child: Text("登陆",style: TextStyle(fontSize: 34.w,color:Colors.white),),
								),
							),
							SizedBox(
								height: 20.w,
							),
							Align(
								alignment:Alignment.center,
								child: Text("注册新账户",style: TextStyle(fontSize: 26.w,color:Colors.white),),
							)
						],
				  	),
				)
			)
		);
	}
}
