import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:rmcagent/Utils/bigtext.dart';
import 'package:get/get.dart';

import '../MainScreen/main_screen.dart';
class TTOBookList extends StatefulWidget {
  const TTOBookList({Key? key}) : super(key: key);

  @override
  State<TTOBookList> createState() => _TTOBookListState();
}

class _TTOBookListState extends State<TTOBookList> {
  String dropdownvalue = 'Filter 1';
  var items = [
    'Filter 1',
    'Filter 2',
    'Filter 3',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(children: [
          Stack(
            children: [
              Container(
                height: Daimension.screenHeight,
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.only(top: Daimension.Height150+Daimension.height20),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context,snapshot){
                    return Container(
                      margin: EdgeInsets.all(Daimension.height10),
                      padding: EdgeInsets.only(left: Daimension.width30,right: Daimension.width30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.grey,
                              offset: Offset(2,4)
                          )
                        ],
                        borderRadius: BorderRadius.circular(Daimension.border20),
                      ),
                      height: Daimension.height50+Daimension.height10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: 'Mira auto'),
                          BigText(text: '100')
                        ],
                      ),
                    );
                  }),
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

                    )
                  ),

                  height: Daimension.Height150,
                  child: Padding(
                    padding:  EdgeInsets.only(left: Daimension.width10,right: Daimension.width30),
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
                        SizedBox(width: Daimension.width30,),
                        BigText(text: 'TTO BOOK LIST',color: Colors.white,),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Daimension.Height250-Daimension.height30-Daimension.height100,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(2,4)
                      )
                    ],
                    borderRadius: BorderRadius.circular(Daimension.border10),
                  ),
                  margin: EdgeInsets.only(left: Daimension.width30,right: Daimension.width30),
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
                              borderRadius: BorderRadius.circular(Daimension.border10),
                              color: Colors.blue
                            ),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              focusColor: Colors.blue,
                              itemHeight:kMinInteractiveDimension,
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: Daimension.width10,right: Daimension.width10),
                                    child: Text(items,style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: Daimension.font20

                                    ),),
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
                        width: Daimension.width300-Daimension.height80,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Vehicle No',
                            contentPadding: EdgeInsets.only(bottom: Daimension.height5),
                            hintStyle: TextStyle(
                                fontSize: Daimension.height20
                            ),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search_rounded,color: Colors.cyan,size: Daimension.height30,)
                    ],
                  ),
                ),
              )
            ],
          )
        ],),
      ),
    );
  }
}
