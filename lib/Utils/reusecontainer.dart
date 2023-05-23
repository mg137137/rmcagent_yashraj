import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Daimenstion/daimension.dart';

class ReuseContainer extends StatelessWidget {
  final String name;
 final  String name1;
   ReuseContainer({Key? key,  required this.name,  required this.name1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Daimension.height100,
      width: Daimension.width120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Daimension.height10),
          color: Colors.white,
          boxShadow: const [
          BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey,
              offset: Offset(2,4)
          )
              ]
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: Daimension.height5,bottom: Daimension.height5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name,style: TextStyle(
                fontSize: Daimension.font20,
                fontWeight: FontWeight.bold
            ),),
            Text(name1,style: TextStyle(
                fontSize: Daimension.height15,
                fontWeight: FontWeight.w800
            ),)
          ],
        ),
      ),
    );
  }
}
