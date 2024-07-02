// ignore_for_file: prefer_const_constructors
import 'package:PinkCity/const/colors.dart';
import 'package:PinkCity/screens/forgetPwScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/customNavigation.dart';
import 'signUpScreen.dart';
class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";
 final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key}); 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.pink.shade500,
              Colors.pink.shade400,
              Colors.pink.shade100
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                   Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome ", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                              //       validator: (value) {
                              //   if(value!.isEmpty){
                              //     return "Username cannot be empty";
                              //   }
                              //   return null;
                              // }, 
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                //     validator: (value) {
                                //   if(value!.isEmpty){
                                //     return "Password cannot be empty";
                                //   }
                                //   else if(value.length<6){
                                //     return "Password length should atleast be 6";
                                //   }
                                //   return null;
                                // }, 
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        TextButton(onPressed:(){Get.to(ForgetPwScreen());},child: Text("Forgot Password?", style: TextStyle(color: Colors.grey)),),
                        SizedBox(height: 40,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.orange,
                          ),
                          child: Center(
                            child: TextButton(onPressed: (){
                              Get.to(CustomBottomBar());
                            },child:Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),),
                          ),
                        ),
                        SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Not registered ?", style: TextStyle(color: Colors.grey),),
                          TextButton(onPressed: (){
                            Get.to(SignUpScreen());
                          }, child:Text("Sign up", style: TextStyle(color: AppColor.orange),))
                        ],
                      ),
                        SizedBox(height: 30,),
                        Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:  Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                                ),
                                child: ElevatedButton(
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  
                                    [
                                    Image.asset('assets/images/virtual/fb.png', ),
                                   SizedBox(
                                     width: 10,
                                      ),
                                      Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),]
                                  ),
                                ),
                              )),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black
                                ),
                                child: ElevatedButton(
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  
                                    [
                                    Image.asset('assets/images/virtual/google.png', ),
                                   SizedBox(
                                     width: 10,
                                      ),
                                      Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),]
                                  ),
                                ),
                              )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
