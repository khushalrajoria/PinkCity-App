import 'package:flutter/material.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class NewPwScreen extends StatelessWidget {
  static const routeName = "/newPw";

  const NewPwScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("New Password", style: Helper.getTheme(context).titleLarge),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextInput(hintText: "New Password"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextInput(
                  hintText: "Confirm Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context)
                          // .pushReplacementNamed(IntroScreen.routeName);
                    },
                    child: const Text("Next"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
