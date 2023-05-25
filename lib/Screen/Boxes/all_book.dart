import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:rmcagent/Screen/Login/login.dart';
import 'package:rmcagent/Utils/bigtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_configration/api_Configration.dart';

class all_book extends StatefulWidget {
  const all_book({Key? key}) : super(key: key);

  @override
  State<all_book> createState() => _all_bookState();
}

class _all_bookState extends State<all_book> {
  String dropdownvalue = 'Filter 1';
  var items = [
    'Filter 1',
    'Filter 2',
    'Filter 3',
  ];

  bool isLoggedIn = false;
  String _response = '';
  SharedPreferences? _prefs;
  List<dynamic> _booklistdetail = [];
  // List<dynamic> _vehicleid = [];
  int length = 1;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    _prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse('http://$api_id/mobileApprouter/getBookList'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      setState(() {
        _response = response.body;

        // _vehiclenumber =
        //     (jsonDecode(response.body)['vehicleRegistrationNumber']);

        _booklistdetail = json.decode(response.body);
        // _vehicleid = (jsonDecode(response.body)['vehicleRegistrationNumber']);
        length = _booklistdetail.length.toInt();
      });
      _prefs?.setString('response', _response);
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
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Daimension.Height150 + Daimension.height20),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(4, 5),
                                blurRadius: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            // margin: EdgeInsets.fromLTRB(10, 45, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _booklistdetail[index]
                                      ['vehicleRegistrationNumber'],
                                ),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final String id = _booklistdetail[index]
                                        ['vehicleRegistrationId'];

                                    // final url = Uri.parse(
                                    //     'http://192.168.0.104:8003/vehicleRegistrationrouter/getVehicleRegistrationDetailsById?vehicleRegistrationId=$id');
                                    //
                                    // final response = await http.get(url);

                                    final response = await http.get(
                                      Uri.parse(
                                          'http://$api_id/vehicleRegistrationrouter/getVehicleRegistrationDetailsById?vehicleRegistrationId=$id'),
                                      headers: {
                                        'Authorization': 'Bearer $token'
                                      },
                                    );

                                    if (response.statusCode == 200) {
                                      // If the server did return a 200 OK response, parse the JSON.
                                      final responseData =
                                          json.decode(response.body);
                                      // id1 = id;
                                      print(responseData);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => vehicle_detail(
                                      //         token: widget.token,
                                      //         id: '$id',
                                      //       )),
                                      // );
                                      return responseData;
                                    } else {
                                      // If the server did not return a 200 OK response, throw an error.
                                      throw Exception('Failed to load data');
                                    }
                                    //
                                    // print(id);
                                    // final responseData = await fetchData(id);
                                    // // Use the response data as needed
                                    // print(responseData);
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                  label: const Text('View'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: _booklistdetail.length,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Daimension.border20),
                          bottomRight: Radius.circular(Daimension.border20),
                        )),
                    height: Daimension.Height150,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Daimension.width10, right: Daimension.width30),
                      child: Row(
                        children: [
                          Container(
                            height: Daimension.height45,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                                size: Daimension.height20,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(), primary: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: Daimension.width30,
                          ),
                          BigText(
                            text: 'TTO BOOK LIST',
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Daimension.Height250 -
                      Daimension.height30 -
                      Daimension.height100,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.grey,
                            offset: Offset(2, 4))
                      ],
                      borderRadius: BorderRadius.circular(Daimension.border10),
                    ),
                    margin: EdgeInsets.only(
                        left: Daimension.width30, right: Daimension.width30),
                    height: Daimension.height50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: Daimension.height45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Daimension.border10),
                                  color: Colors.blue),
                              child: DropdownButton(
                                dropdownColor: Colors.white,
                                focusColor: Colors.blue,
                                itemHeight: kMinInteractiveDimension,
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Daimension.width10,
                                          right: Daimension.width10),
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: Daimension.font20),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Daimension.width300 - Daimension.height80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Vehicle No',
                              contentPadding:
                                  EdgeInsets.only(bottom: Daimension.height5),
                              hintStyle:
                                  TextStyle(fontSize: Daimension.height20),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
