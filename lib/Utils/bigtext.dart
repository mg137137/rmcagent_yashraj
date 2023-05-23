import 'package:flutter/cupertino.dart';

import '../Daimenstion/daimension.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow =TextOverflow.ellipsis,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow : overflow,
      text,style: TextStyle(
        fontSize: size==0?Daimension.font20:size,
        color: color,
        fontWeight: FontWeight.w500
    ),
    );
  }
}