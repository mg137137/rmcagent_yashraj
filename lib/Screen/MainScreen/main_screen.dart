import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:rmcagent/Screen/MainScreen/headerofmainpage.dart';
import 'package:rmcagent/Utils/bigtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/reusecontainer.dart';
import '../../api_configration/api_Configration.dart';
import '../Boxes/Categorie Wise Book.dart';
import '../Boxes/Check_Book_Status.dart';
import '../Boxes/all_book.dart';
import '../Login/login.dart';

bool check_api = false;
bool Logout = true;
String name = '';
String TotalBookNumber = '', Pendingbook = '', Appointment = '', Complete = '';
late final String stoken;
TextEditingController _vehiclesearch = TextEditingController();
late String searchdata;

class MainScreen extends StatefulWidget {
  final String token;
  const MainScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, dynamic> data = {};
  List<dynamic> _booklistdetail = [];

  bool isLoggedIn = false;
  String _response = '';
  SharedPreferences? _prefs;
  List<dynamic> _delardetail = [];
  List<dynamic> _Totalbooknumber = [];
  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
    _fetchData();
    _fetchNumber();
  }

  @override
  void dispose() {
    _vehiclesearch.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    _prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse('$api_Dashboard_Dealer_List'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      setState(() {
        _response = response.body;

        // _vehiclenumber =
        //     (jsonDecode(response.body)['vehicleRegistrationNumber']);

        _delardetail = json.decode(response.body);
      });
      _prefs?.setString('response', _response);
    }
  }

  Future<void> _fetchNumber() async {
    _prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse('$api_Dashboard_Count_Number'),
      headers: {'Authorization': 'Bearer $token'},
    );
    _response = response.body;

    if (response.statusCode == 200) {
      setState(() {
        print(_response);
        // print(_response.('AllBook'));
        // data = (jsonDecode(response.body)[AllBook]);
        // TotalBookNumber = (jsonDecode(response.body)['AllBook']).toString();
        Pendingbook = (jsonDecode(response.body)['AllPendingBook']).toString();
        Appointment =
            (jsonDecode(response.body)['AllAppointmentBook']).toString();
        Complete = (jsonDecode(response.body)['AllCompleteBook']).toString();
        print(TotalBookNumber);
        // print(data);
      });
      _prefs?.setString('response', _response);
    }
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? U_Name = prefs.getString('userName');
    if (token != null) {
      _prefs = await SharedPreferences.getInstance();
      final response = await http.get(
        Uri.parse('$api_Dashboard_Count_Number'),
        headers: {'Authorization': 'Bearer $token'},
      );
      _response = response.body;
      if (response.statusCode == 200) {
        setState(() {
          name = U_Name.toString();
          print(_response);
          // print(_response.('AllBook'));
          // data = (jsonDecode(response.body)[AllBook]);
          TotalBookNumber = (jsonDecode(response.body)['AllBook']).toString();
          Pendingbook =
              (jsonDecode(response.body)['AllPendingBook']).toString();
          Appointment =
              (jsonDecode(response.body)['AllAppointmentBook']).toString();
          Complete = (jsonDecode(response.body)['AllCompleteBook']).toString();
          print(TotalBookNumber);
          // print(data);
        });
        _prefs?.setString('response', _response);
      }
    }

    setState(() {
      check_api = true;
      isLoggedIn = token != null && U_Name != null;

      stoken = token.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headerOfMainScreen(),
          Container(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Daimension.width30, right: Daimension.width30),
                child: Container(
                  padding: EdgeInsets.only(
                      left: Daimension.width20, right: Daimension.width20),
                  height: Daimension.height80 - Daimension.height20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Daimension.height10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.grey,
                            offset: Offset(2, 4))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: 'Total Book    :-',
                        size: Daimension.height20,
                      ),
                      BigText(
                        text: '$TotalBookNumber',
                        size: Daimension.height20,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Daimension.height30,
                    left: Daimension.width10,
                    right: Daimension.width10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ReuseContainer(name1: 'Pandding', name: '$Pendingbook'),
                    ReuseContainer(name1: 'Appointmnet', name: '$Appointment'),
                    ReuseContainer(name1: 'Complete', name: '$Complete'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Daimension.height30,
                    left: Daimension.width10,
                    right: Daimension.width10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(All_Book(
                          token: '${widget.token}',
                        ));
                        Get.snackbar("Your TTOBook ", "",
                            duration: const Duration(milliseconds: 800),
                            backgroundColor: Colors.transparent);
                      },
                      child: Container(
                        height: Daimension.height100,
                        width: Daimension.width120,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Daimension.height10),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.grey,
                                  offset: Offset(2, 4))
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Daimension.height5,
                              bottom: Daimension.height5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'All Book',
                                style: TextStyle(
                                    fontSize: Daimension.font20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Catogerywise_Book(
                          token: '${widget.token}',
                          dropdown_Value: 0,
                        ));
                        Get.snackbar("Vehical detailes", "",
                            duration: Duration(milliseconds: 800));
                      },
                      child: Container(
                        height: Daimension.height100,
                        width: Daimension.width120,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Daimension.height10),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.grey,
                                  offset: Offset(2, 4))
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Daimension.height5,
                              bottom: Daimension.height5,
                              left: Daimension.width10,
                              right: Daimension.width10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Categorie Wise Book',
                                style: TextStyle(
                                    fontSize: Daimension.font20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Checkbook_Status(
                          token: '${widget.token}',
                          dopdown_name: 'Pending',
                        ));
                        Get.snackbar("Documents", "",
                            duration: Duration(milliseconds: 800));
                      },
                      child: Container(
                        height: Daimension.height100,
                        width: Daimension.width120,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Daimension.height10),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.grey,
                                  offset: Offset(2, 4))
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Daimension.height5,
                              bottom: Daimension.height5,
                              left: Daimension.width10,
                              right: Daimension.width10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Check Book Satement',
                                style: TextStyle(
                                    fontSize: Daimension.font20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Daimension.width20,
                    right: Daimension.width20,
                    top: Daimension.height30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Daimension.border10)),
                  height: Daimension.height50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: 'Delear List',
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Daimension.width20,
                    right: Daimension.width20,
                    top: Daimension.height20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Daimension.border10)),
                  height: Daimension.height50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: 'Documnet List',
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
