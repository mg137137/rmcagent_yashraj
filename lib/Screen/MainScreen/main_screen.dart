


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:rmcagent/Screen/TTOBookLIst/ttobooklist.dart';
import 'package:rmcagent/Screen/VehicalDetails/vehicaldetailes.dart';
import 'package:rmcagent/Utils/bigtext.dart';
import 'package:rmcagent/Utils/reusecontainer.dart';
import 'package:get/get.dart';
import '../Documnets/documents.dart';
import 'headerofmainpage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headerOfMainScreen(),
          Container(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: Daimension.width30,right: Daimension.width30),
                  child: Container(
                    padding:  EdgeInsets.only(left: Daimension.width20,right: Daimension.width20),
                    height: Daimension.height80-Daimension.height20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Daimension.height10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.grey,
                              offset: Offset(2,4)
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: 'Total Book    :-',size: Daimension.height20,),
                        BigText(text: '1000',size: Daimension.height20,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: Daimension.height30,left: Daimension.width10,right: Daimension.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReuseContainer(name1: 'Pandding', name: '100'),
                      ReuseContainer(name1: 'Appointmnet', name: '100'),
                      ReuseContainer(name1: 'Complete', name: '100'),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: Daimension.height30,left: Daimension.width10,right: Daimension.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap : (){
                          Get.to(TTOBookList());
                          Get.snackbar("Your TTOBook ", "",duration: const Duration(milliseconds: 800),backgroundColor: Colors.transparent);
                        },
                        child: Container(
                          height: Daimension.height100,
                          width: Daimension.width120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Daimension.height10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    color: Colors.grey,
                                    offset: Offset(2,4)
                                )
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(top: Daimension.height5,bottom: Daimension.height5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('All Book',style: TextStyle(
                                    fontSize: Daimension.font20,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(VehicalDetailes());
                          Get.snackbar("Vehical detailes", "",duration: Duration(milliseconds: 800));
                        },
                        child: Container(
                          height: Daimension.height100,
                          width: Daimension.width120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Daimension.height10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    color: Colors.grey,
                                    offset: Offset(2,4)
                                )
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(top: Daimension.height5,bottom: Daimension.height5,left: Daimension.width10,right: Daimension.width10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Categorie Wise Book',style: TextStyle(
                                    fontSize: Daimension.font20,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(Documents());
                          Get.snackbar("Documents", "",duration: Duration(milliseconds: 800));
                        },
                        child: Container(
                          height: Daimension.height100,
                          width: Daimension.width120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Daimension.height10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    color: Colors.grey,
                                    offset: Offset(2,4)
                                )
                              ],
                              color: Colors.white
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(top: Daimension.height5,bottom: Daimension.height5,left: Daimension.width10,right: Daimension.width10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Check Book Satement',style: TextStyle(
                                    fontSize: Daimension.font20,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: Daimension.width20,right: Daimension.width20,top: Daimension.height30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                      borderRadius: BorderRadius.circular(Daimension.border10)
                    ),
                    height: Daimension.height50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: 'Delear List',color: Colors.white,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: Daimension.width20,right: Daimension.width20,top: Daimension.height20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(Daimension.border10)
                    ),
                    height: Daimension.height50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: 'Documnet List',color: Colors.white,)
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}


