import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmcagent/Daimenstion/daimension.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: Daimension.screenHeight,
              )
            ],
          )
        ],
      ),
    );
  }
}
