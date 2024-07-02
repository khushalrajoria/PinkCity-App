// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import '../screens/loginScreen.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signUpScreen';

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: Helper.getTheme(context).titleLarge,
              ),
              Spacer(),
              Text(
                "Add your details to sign up",
              ),
              Spacer(),
              CustomTextInput(hintText: "Name",),
              Spacer(),
              CustomTextInput(hintText: "Email"),
              Spacer(),
              CustomTextInput(hintText: "Mobile No"),
              Spacer(),
              CustomTextInput(hintText: "Address"),
              Spacer(),
              CustomTextInput(hintText: "Password"),
              Spacer(),
              CustomTextInput(hintText: "Confirm Password"),
              Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(LoginScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already have an Account?"),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
