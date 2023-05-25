import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:rmcagent/Screen/MainScreen/main_screen.dart';
import 'package:rmcagent/Utils/bigtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_configration/api_Configration.dart';

late final String U_Name;
late String token;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static bool main = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? U_Name = prefs.getString('userName');

    if (token != null && U_Name != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    token: '$token',
                  )));
    }
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    String username = _usernameController.text;
    String password = _passwordController.text;
    var response = await http.post(Uri.parse('$api_login'),
        body: {'agentEmailId': username, 'agentPassword': password});

    if (response.statusCode == 200) {
      main = true;
      var json = jsonDecode(response.body);
      token = json['token'];
      U_Name = (jsonDecode(response.body)['userName']).toString();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('userName', U_Name);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    token: '$token',
                  )));
      Get.snackbar(U_Name, 'Welcome !',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(milliseconds: 800));
      print(token);

      print(U_Name);

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Invalid username or password';
        final snackBar = SnackBar(
          content: Text('$_errorMessage'),
          // backgroundColor: (Colors.black),
          // action: SnackBarAction(label: 'dismiss', onPressed: () { },)
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Daimension.screenHeight,
                  color: Colors.blue,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      height: Daimension.Height500,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Daimension.border30),
                            topLeft: Radius.circular(Daimension.border30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Daimension.height20,
                            left: Daimension.width20,
                            right: Daimension.width20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: 'Sign in to',
                                size: Daimension.font30,
                              ),
                              SizedBox(
                                height: Daimension.height5,
                              ),
                              Text(
                                'Your Account !',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Daimension.font30),
                              ),
                              SizedBox(
                                height: Daimension.height30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Daimension.width20,
                                    right: Daimension.width20),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: Daimension.height30,
                                        ),
                                        Container(
                                            width: Daimension.screenWeight -
                                                Daimension.width45 -
                                                Daimension.width20 -
                                                Daimension.width20,
                                            child: TextField(
                                              controller: _usernameController,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: Daimension
                                                              .width25,
                                                          top: Daimension
                                                              .height20,
                                                          bottom: Daimension
                                                              .height20),
                                                  labelText: 'username',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 3,
                                                            color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Daimension
                                                                .border10),
                                                  ),
                                                  // Set border for focused state
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Daimension
                                                                .border10),
                                                  )),
                                            )),
                                        SizedBox(
                                          height: Daimension.height15,
                                        ),
                                        Container(
                                            width: Daimension.screenWeight -
                                                Daimension.width45 -
                                                Daimension.width20 -
                                                Daimension.width20,
                                            child: TextField(
                                              controller: _passwordController,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: Daimension
                                                              .width25,
                                                          top: Daimension
                                                              .height20,
                                                          bottom: Daimension
                                                              .height20),
                                                  labelText: 'Enter password',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 3,
                                                            color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Daimension
                                                                .border10),
                                                  ),
                                                  // Set border for focused state
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.black54),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Daimension
                                                                .border10),
                                                  )),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Daimension.height20,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: Daimension.width20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BigText(text: 'Forgot Password?'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Daimension.height30,
                              ),
                              Center(
                                  child: SizedBox(
                                height: Daimension.height100 / 2,
                                width: Daimension.screenWeight -
                                    Daimension.width45 -
                                    Daimension.width20 -
                                    Daimension.width20,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_isLoading != null) {
                                      _login();
                                      print(main);
                                    } else {
                                      print('login page else part run');
                                    }
                                  },
                                  child: BigText(
                                    text: 'Login',
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 3, // the thickness
                                        color: Colors
                                            .blue // the color of the border
                                        ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      )),
                ),
                Positioned(
                    bottom: Daimension.screenHeight - Daimension.Height250,
                    right: Daimension.Weight100,
                    left: Daimension.Weight100,
                    child: Container(
                        height: Daimension.Height150,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/Image/1st.jpeg"),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
