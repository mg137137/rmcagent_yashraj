import 'package:flutter/material.dart';
import 'package:rmcagent/Screen/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Daimenstion/daimension.dart';
import '../../Utils/bigtext.dart';
import 'main_screen.dart';

class headerOfMainScreen extends StatefulWidget {
  const headerOfMainScreen({
    super.key,
  });

  @override
  State<headerOfMainScreen> createState() => _headerOfMainScreenState();
}

class _headerOfMainScreenState extends State<headerOfMainScreen> {
  Map<String, dynamic> data = {};
  List<dynamic> _booklistdetail = [];

  bool isLoggedIn = true;
  String _response = '';
  SharedPreferences? _prefs;
  List<dynamic> _delardetail = [];
  List<dynamic> _Totalbooknumber = [];

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userName');

    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Daimension.height100 +
              Daimension.height100 +
              Daimension.height100 +
              Daimension.height45,
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(Daimension.height45),
                    bottomLeft: Radius.circular(Daimension.height45))),
            height: Daimension.Height250 + Daimension.height45,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Daimension.height30,
                      left: Daimension.width20,
                      right: Daimension.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: 'RTO AGENT MANAGMENT',
                            color: Colors.white,
                          ),
                          BigText(
                            text: 'Work For Rto',
                            color: Colors.white,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (isLoggedIn) {
                              _logout();

                              print('logout sucessful');
                              Logout = true;
                              if (Logout == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              }
                            } else {
                              print('the else part called');
                            }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => Loginpage()),
                            // );
                          },
                          child: Column(
                            children: const [
                              Icon(Icons.logout),
                              Text("logout"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Daimension.height5, left: Daimension.width20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_box,
                        size: Daimension.height120,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Daimension.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: 'Welcome ',
                              color: Colors.white,
                              size: Daimension.height30,
                            ),
                            BigText(
                              text: '$name',
                              color: Colors.white,
                              size: Daimension.height30,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: Daimension.height20,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5.0, color: Colors.grey, offset: Offset(2, 4))
                ],
                borderRadius: BorderRadius.circular(Daimension.height20)),
            margin: EdgeInsets.only(
                left: Daimension.width30, right: Daimension.width30),
            height: Daimension.height50 + Daimension.height10,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Daimension.width20, right: Daimension.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Daimension.width300 - Daimension.height80,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Vehicle No',
                        contentPadding:
                            EdgeInsets.only(bottom: Daimension.height5),
                        hintStyle: TextStyle(fontSize: Daimension.height20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Colors.cyan,
                    size: Daimension.height30,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
