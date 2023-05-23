import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmcagent/Daimenstion/daimension.dart';
import 'package:get/get.dart';
import 'package:rmcagent/Screen/MainScreen/main_screen.dart';
import 'package:rmcagent/Utils/bigtext.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  color: Colors.blue,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: Daimension.Height500,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Daimension.border30),
                        topLeft: Radius.circular(Daimension.border30),
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top:Daimension.height20,left: Daimension.width20 , right: Daimension.width20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Sign in to',size: Daimension.font30,),
                            SizedBox(height: Daimension.height5,),
                            Text('Your Account !',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Daimension.font30
                            ),),
                            SizedBox(height: Daimension.height30,),
                            Padding(
                              padding:  EdgeInsets.only(left: Daimension.width20,right: Daimension.width20),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: Daimension.height30,),
                                      Container(
                                        width:Daimension.screenWeight-Daimension.width45-Daimension.width20-Daimension.width20,
                                        child:
                                        TextField(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: Daimension.width25,top: Daimension.height20,bottom :Daimension.height20),
                                              labelText: 'Enter something',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(width: 3, color: Colors.blue),
                                                borderRadius: BorderRadius.circular(Daimension.border10),
                                              ),
                                              // Set border for focused state
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:  BorderSide(width: 3, color: Colors.red),
                                                borderRadius: BorderRadius.circular(Daimension.border10),
                                              )),
                                        )

                                      ),
                                      SizedBox(height: Daimension.height15,),
                                      Container(
                                        width:Daimension.screenWeight-Daimension.width45-Daimension.width20-Daimension.width20,
                                        child:TextField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: Daimension.width25,top: Daimension.height20,bottom :Daimension.height20),
                                              labelText: 'Enter something',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(width: 3, color: Colors.blue),
                                                borderRadius: BorderRadius.circular(Daimension.border10),
                                              ),
                                              // Set border for focused state
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:  BorderSide(width: 3, color: Colors.black54),
                                                borderRadius: BorderRadius.circular(Daimension.border10),
                                              )
                                          ),
                                        )

                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Daimension.height20,),
                            Padding(
                              padding:  EdgeInsets.only(right: Daimension.width20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  BigText(text: 'Forgot Password?'),
                                ],
                              ),
                            ),
                        SizedBox(height: Daimension.height30,),
                        Center(
                          child: SizedBox(
                            height: Daimension.height100/2,
                            width: Daimension.screenWeight-Daimension.width45-Daimension.width20-Daimension.width20 ,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(MainScreen());
                                  Get.snackbar("username", "Login Succed",snackStyle: SnackStyle.FLOATING,duration: Duration(seconds: 1));

                                },
                                child:  BigText(text: 'Login',color: Colors.white,),
                                style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 3, // the thickness
                                        color: Colors.blue // the color of the border
                                    ),

                            ),
                          ),
                        )
                        )
                          ],
                        ),
                      ),
                    )


                  ),
                ),
                Positioned(
                    bottom: Daimension.screenHeight-Daimension.Height250,
                    right: Daimension.Weight100,
                    left: Daimension.Weight100,
                    child: Container(
                      height: Daimension.Height150,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/Image/1st.jpeg"),
                  )
                ))


              ],
            ),
          ],
        ),
      ),
    );
  }
}
