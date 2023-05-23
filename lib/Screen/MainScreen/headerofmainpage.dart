import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Daimenstion/daimension.dart';
import '../../Utils/bigtext.dart';

class headerOfMainScreen extends StatefulWidget {
  const headerOfMainScreen({
    super.key,
  });

  @override
  State<headerOfMainScreen> createState() => _headerOfMainScreenState();
}

class _headerOfMainScreenState extends State<headerOfMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Daimension.height100+Daimension.height100+Daimension.height100+Daimension.height80,
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(Daimension.height20),
                    bottomLeft: Radius.circular(Daimension.height20)
                )

            ),

            height: Daimension.Height250+Daimension.height80,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: Daimension.height50,left: Daimension.width20,right: Daimension.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText( text: 'RTO AGENT MANAGMENT',color: Colors.white,),
                          BigText(text: 'Work For Rto',color: Colors.white,)
                        ],
                      ),
                      Column(
                        children: [
                          Center(child: Icon(Icons.logout_outlined,color: Colors.white,size: Daimension.height30,)),
                          BigText(text: 'LogOut',color: Colors.white,)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: Daimension.height30,left: Daimension.width20),
                  child: Row(
                    children: [
                      Icon(Icons.account_box,size: Daimension.height120,),
                      Padding(
                        padding:  EdgeInsets.only(left: Daimension.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Welcome ',color: Colors.white,size: Daimension.height30,),
                            BigText(text: 'Yashraj Parmar',color: Colors.white,size: Daimension.height30,)
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
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2,4)
                  )
                ],
                borderRadius: BorderRadius.circular(Daimension.height20)
            ),
            margin: EdgeInsets.only(left: Daimension.width30,right:Daimension.width30 ),

            height: Daimension.height50+Daimension.height10,
            child: Padding(
              padding: EdgeInsets.only(left: Daimension.width20 , right: Daimension.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
          ),
        ),
      ],
    );
  }
}