import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:rmcagent/Utils/bigtext.dart';

import '../MainScreen/main_screen.dart';

class VehicalDetailes extends StatefulWidget {
  const VehicalDetailes({Key? key}) : super(key: key);

  @override
  State<VehicalDetailes> createState() => _VehicalDetailesState();
}

class _VehicalDetailesState extends State<VehicalDetailes> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: Daimension.screenHeight,
                color: Colors.blue,
                child: Padding(
                  padding:  EdgeInsets.only(top: Daimension.height50,left: Daimension.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.to(MainScreen());
                          },
                          child: Container(
                              height: Daimension.height50,
                              width: Daimension.width30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(Daimension.border30*2)
                              ),
                              child: Icon(Icons.arrow_back_ios_new,color: Colors.black54,))),
                      SizedBox(width: Daimension.width30,),
                      Padding(
                        padding:  EdgeInsets.only(top: Daimension.height15),
                        child: BigText(text: 'VEHICAL DETAIL ',color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Daimension.Height150-Daimension.height20,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Daimension.border20),
                      topRight: Radius.circular(Daimension.border20)
                    )
                  ),
                  height: Daimension.screenHeight-Daimension.height100,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                           height: Daimension.Height250,
                        ),
                          Positioned(
                            top: Daimension.height50,
                            left: 0,
                            right: 0,
                            bottom: Daimension.height5,
                            child: Padding(
                              padding:  EdgeInsets.only(left: Daimension.width30,right: Daimension.width30),
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5.0,
                                          color: Colors.grey,
                                          offset: Offset(2,4)
                                      )
                                    ],
                                    color: Colors.white,
                                  borderRadius: BorderRadius.circular(Daimension.border10)
                                ),
                                height: Daimension.Height250-Daimension.height50,
                              ),
                            ),
                          ),
                          Positioned(
                            top: Daimension.height26,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding:  EdgeInsets.only(left: Daimension.width45,right: Daimension.width45),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                  borderRadius: BorderRadius.circular(Daimension.border10)
                                ),
                                height:Daimension.height50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Vehical Detalis',style: (
                                    TextStyle(
                                      fontSize: Daimension.font20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    )
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
